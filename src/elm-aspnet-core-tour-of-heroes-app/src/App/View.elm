module App.View exposing (..)

import Html exposing (Html, div, h1, text) 

import App.Messages exposing (Msg(..))
import App.Models exposing (Model)
import Heroes.List
import Heroes.Edit

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , Heroes.List.view model.heroes
        , Heroes.Edit.view model.selectedHero
        ]
