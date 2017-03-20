module App.View exposing (..)

import Html exposing (..) 
import Html.Attributes exposing (value)
import Html.Events exposing (onInput, targetValue)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model)

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , h2 [] [ text model.hero.name, text " details!" ]
        , div [] 
            [ label [] [ text "id: " ] 
            , text (toString model.hero.id) ]
        , div []
            [ label [] [ text "name: " ]
            , input 
                [ value model.hero.name
                , onInput ChangeName
                ] 
                [] 
            ]
        ]

