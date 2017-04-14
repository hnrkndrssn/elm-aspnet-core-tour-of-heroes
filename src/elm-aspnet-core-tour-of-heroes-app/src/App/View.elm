module App.View exposing (..)

import Html exposing (..) 
import Html.Attributes exposing (href, class)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, Route(..))
import Dashboard.View
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

getActiveRouteClass : Route -> Route -> String
getActiveRouteClass expectedRoute actualRoute =
    if actualRoute == expectedRoute then
        "active"
    else
        ""

view : Model -> Html Msg
view model =
    div []
        [ div [ class "app" ]
            [ h1 [] [ text model.title ]
            , nav [] 
                [ a [ href "/dashboard", onLinkClick (ChangeLocation "/dashboard"), class (getActiveRouteClass DashboardRoute model.route)] [ text "Dashboard" ]
                , a [ href "/heroes", onLinkClick (ChangeLocation "/heroes"), class (getActiveRouteClass HeroesRoute model.route)] [ text "Heroes" ]
                ]
            ]
        , page model
        ]

page : Model -> Html Msg
page model =
    case model.route of

        DashboardRoute ->
            Dashboard.View.view model.topHeroes

        HeroesRoute ->
            Heroes.List.view model.heroes

        _ ->
            text "Not found"
