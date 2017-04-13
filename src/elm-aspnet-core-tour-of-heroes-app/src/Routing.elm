module Routing exposing (..)

import Navigation exposing (Location)
import App.Models exposing (Model, Route(..))
import App.Messages exposing (Msg)
import Heroes.Commands exposing (fetchHeroes)
import UrlParser exposing (..)

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map HeroesRoute (s "heroes")
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of

        Just route ->
            route

        Nothing ->
            HomeRoute

route2Cmd : Route -> Cmd Msg
route2Cmd route =
    case route of

        HeroesRoute ->
            fetchHeroes

        _ ->
            Cmd.none
