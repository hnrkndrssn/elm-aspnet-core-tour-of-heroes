module App.Models exposing (..)

import Heroes.Models exposing (Hero, heroes)

type alias Model =
    { title: String
    , heroes: List Hero
    , selectedHero: Maybe Hero 
    }

initialModel : Model
initialModel =
    { title = "Tour of Heroes"
    , heroes = heroes
    , selectedHero = Nothing
    }
