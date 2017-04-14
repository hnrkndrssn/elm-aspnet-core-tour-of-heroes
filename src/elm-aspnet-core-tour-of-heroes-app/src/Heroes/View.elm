module Heroes.View exposing (..)

import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)

import App.Models exposing (Model)
import App.Messages exposing (Msg)
import Heroes.List
import Heroes.Details

view : Model -> Html Msg
view model =
    div [ class "heroes" ]
        [ h2 [] [ text "My Heroes" ]
        , Heroes.List.view model.heroes
        , Heroes.Details.view model.selectedHero
        ]
