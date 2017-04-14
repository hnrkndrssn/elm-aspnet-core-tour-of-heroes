module Routing exposing (..)

import Navigation exposing (Location)
import App.Models exposing (Model, Route(..))
import UrlParser exposing (..)

dashboardRoute : String
dashboardRoute = "dashboard"

heroesRoute : String
heroesRoute = "heroes"

heroDetailsRoute : String
heroDetailsRoute = "detail"

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map DashboardRoute top
        , map DashboardRoute (s dashboardRoute)
        , map HeroRoute (s heroDetailsRoute </> int)
        , map HeroesRoute (s heroesRoute)
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of

        Just route ->
            route

        Nothing ->
            DashboardRoute

getRouteUrl : String -> String
getRouteUrl route =
    "/" ++ route

toUrl : Route -> String
toUrl route =
    case route of

        DashboardRoute ->
            getRouteUrl dashboardRoute

        HeroesRoute ->
            getRouteUrl heroesRoute

        HeroRoute heroId ->
            getRouteUrl heroDetailsRoute ++ "/" ++ (toString heroId)

        NotFoundRoute ->
            getRouteUrl dashboardRoute