module App.View exposing (..)

import Html exposing (..) 
import Html.Attributes exposing (href, class)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, Route(..))
import App.Utils exposing (onLinkClick)
import Dashboard.View
import Heroes.View
import Heroes.Edit
import Routing

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
                [ a [ href "/dashboard", onLinkClick (ChangeLocation (Routing.toUrl DashboardRoute)), class (getActiveRouteClass DashboardRoute model.route)] [ text "Dashboard" ]
                , a [ href "/heroes", onLinkClick (ChangeLocation (Routing.toUrl HeroesRoute)), class (getActiveRouteClass HeroesRoute model.route)] [ text "Heroes" ]
                ]
            ]
        , page model
        ]

page : Model -> Html Msg
page model =
    case model.route of

        DashboardRoute ->
            let
              topHeroes =
                case model.heroes of
                    
                    Just heroes ->
                        List.take 4 (List.drop 1 heroes)
                    
                    Nothing ->
                        []
            in
                Dashboard.View.view (Just topHeroes)

        HeroesRoute ->
            Heroes.View.view model

        HeroRoute heroId ->
            let
                heroesById =
                    case model.heroes of

                        Just heroes ->
                            List.filter (\hero -> hero.id == heroId) heroes

                        Nothing ->
                            []
                selectedHero = List.head heroesById
            in
                Heroes.Edit.view selectedHero

        _ ->
            text "Not found"
