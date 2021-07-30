module AngularCustomElement.Styled exposing (view, viewWithTransclusion)

{-| The package contains helper function to view custom elements to reuse AngularJS directives/components in Elm.


# View

@docs view, viewWithTransclusion

-}

import Html.Styled as Html exposing (Html)


{-| Creates a custom element which will be used to create AngularJS component
-}
view :
    { componentName : String
    , attributes : List (Html.Attribute msg)
    }
    -> Html msg
view { componentName, attributes } =
    Html.node componentName attributes [ customElementComponent ]


{-| Creates a custom element which will be used to create AngularJS component with transclusion
-}
viewWithTransclusion :
    { componentName : String
    , attributes : List (Html.Attribute msg)
    , transclude : List (Html Never)
    }
    -> Html msg
viewWithTransclusion { componentName, attributes, transclude } =
    Html.node componentName attributes [ customElementComponent, customElementTransclude transclude ]


{-| Creates a placeholder for custom element component. Later AngularJS component will be embed to this element.
-}
customElementComponent : Html msg
customElementComponent =
    Html.node "cs-custom-element-component" [] []


{-| Creates a placeholder for custom element component. Later AngularJS component will be embed to this element.
-}
customElementTransclude : List (Html Never) -> Html msg
customElementTransclude content =
    Html.map never (Html.node "cs-custom-element-transclude" [] content)