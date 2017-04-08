module Heroes.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import App.Messages exposing (Msg(..))
import Heroes.Models exposing (Hero)

view : Maybe (List Hero) -> Html Msg
view heroes =
    div []
        [ h2 [] [ text "My Heroes" ]
        , maybeList heroes
        ] 

maybeList : Maybe (List Hero) -> Html Msg
maybeList heroes =
    case heroes of

        Just heroes ->
            ul [ class "heroes" ]
                (List.map heroRow heroes)
        
        Nothing ->
            text ""

heroRow : Hero -> Html Msg
heroRow hero =
    let
        getClass isSelected =
            if isSelected then
                "selected"
            else
                ""
        
        selectHeroMessage =
            SelectHero hero
    in
        li [ class (getClass hero.isSelected), onClick selectHeroMessage ]
            [ span [ class "badge" ] [ text (toString hero.id) ]
            , text hero.name
            ]
