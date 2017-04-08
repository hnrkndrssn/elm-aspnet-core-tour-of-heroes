module App.Models exposing (..)

import Heroes.Models exposing (Hero)

type alias Model =
    { title: String
    , heroes: Maybe (List Hero)
    , selectedHero: Maybe Hero 
    }

initialModel : Model
initialModel =
    { title = "Tour of Heroes"
    , heroes = Nothing
    , selectedHero = Nothing
    }
