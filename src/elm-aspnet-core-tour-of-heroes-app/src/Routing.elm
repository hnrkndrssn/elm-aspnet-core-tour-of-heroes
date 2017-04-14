module Routing exposing (..)

import Navigation exposing (Location)
import App.Models exposing (Model, Route(..))
import App.Messages exposing (Msg)
import Heroes.Commands exposing (fetchHeroes, fetchTopHeroes)
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map DashboardRoute top
        , map HeroesRoute (s "heroes")
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of

        Just route ->
            route

        Nothing ->
            DashboardRoute

route2Cmd : Route -> Cmd Msg
route2Cmd route =
    case route of

        DashboardRoute ->
            fetchTopHeroes
            
        HeroesRoute ->
            fetchHeroes

        _ ->
            Cmd.none
