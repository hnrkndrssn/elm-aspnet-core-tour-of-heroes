module Heroes.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value, class)
import Html.Events exposing (onInput, onClick)

import App.Messages exposing (Msg(..))
import Heroes.Models exposing (Hero)

view : Maybe Hero -> Html Msg
view hero =
    case hero of
        Nothing -> 
            text ""

        Just hero ->
            div [ class "hero-details" ]
                [ h2 [] [ text hero.name, text " details!" ]
                , div [] 
                    [ label [] [ text "id: " ] 
                    , text (toString hero.id) ]
                , div []
                    [ label [] [ text "name: " ]
                    , input 
                        [ value hero.name
                        , onInput ChangeName
                        ] 
                        [] 
                    ]
                , button [ onClick (GoBack 1) ]
                    [ text "Back" ]
                ]
