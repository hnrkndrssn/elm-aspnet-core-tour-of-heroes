module App.View exposing (..)

import Html exposing (..) 
import Html.Attributes exposing (href, class)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, Route(..))
import Heroes.List

onLinkClick : msg -> Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
        onWithOptions "click" options (Decode.succeed message)

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , nav [] 
            [ a [ href "/heroes", onLinkClick (ChangeLocation "/heroes"), class (if model.route == HeroesRoute then "active" else "")] [ text "Heroes" ]
            ]
        , page model
        ]

page : Model -> Html Msg
page model =
    case model.route of

        HeroesRoute ->
            Heroes.List.view model.heroes

        _ ->
            text ""
