module App.View exposing (..)

import Html exposing (..) 
import Html.Attributes exposing (class, value)
import Html.Events exposing (onInput, targetValue, onClick)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, Hero)

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , heroesList model.heroes
        , selectedHero model.selectedHero
        ]

heroesList : (List Hero) -> Html Msg
heroesList heroes =
    div []
        [ h2 [] [ text "My Heroes" ]
        , ul [ class "heroes" ]
            (List.map heroRow heroes)
        ] 

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

selectedHero : Maybe Hero -> Html Msg
selectedHero hero =
    case hero of
        Nothing -> 
            text ""

        Just hero ->
            div []
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
                ]
