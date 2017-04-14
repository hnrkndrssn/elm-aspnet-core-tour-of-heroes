module Heroes.Details exposing (..)

import Html exposing (..)

import App.Messages exposing (Msg(..))
import App.Models exposing (Route(HeroRoute))
import App.Utils exposing (onLinkClick)
import Heroes.Models exposing (Hero)
import Routing


view : Maybe Hero -> Html Msg
view hero =
    case hero of 

        Just hero ->
            div []
                [ h2 [] [ text ((String.toUpper hero.name) ++ " is my hero") ]
                , button [ onLinkClick (ChangeLocation (Routing.toUrl (HeroRoute hero.id))) ] [ text "View Details" ]
                ]
        Nothing ->
            text ""