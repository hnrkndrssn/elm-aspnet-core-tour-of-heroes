module App.Models exposing (..)

import Heroes.Models exposing (Hero)

type Route
    = DashboardRoute
    | HeroesRoute
    | HeroRoute Int
    | NotFoundRoute

type alias Model =
    { title: String
    , heroes: Maybe (List Hero)
    , selectedHero: Maybe Hero 
    , route : Route
    }

initialModel : Route -> Model
initialModel route =
    { title = "Tour of Heroes"
    , heroes = Nothing
    , selectedHero = Nothing
    , route = route
    }
