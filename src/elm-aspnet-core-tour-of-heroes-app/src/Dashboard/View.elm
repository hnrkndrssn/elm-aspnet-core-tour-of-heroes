module Dashboard.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)

import App.Messages exposing (Msg(..))
import Heroes.Models exposing (Hero)

view : Maybe (List Hero) -> Html Msg
view heroes =
    div [ class "dashboard" ]
        [ h3 [] [ text "Top Heroes" ]
        , maybeList heroes
        ]

maybeList : Maybe (List Hero) -> Html Msg
maybeList heroes =
    case heroes of
        Just heroes ->
            div [ class "grid grid-pad" ]
                (List.map heroCard heroes)
        
        Nothing ->
            text ""


heroCard : Hero -> Html Msg
heroCard hero =
    div [ class "col-1-4"]
        [ div [ class "module hero" ]
            [ h4 []
                [ text hero.name ]
            ]
        ]