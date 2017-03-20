module App.Models exposing (..)

type alias Model =
    { title: String
    , hero: Hero 
    }

initialModel : Model
initialModel =
    { title = "Tour of Heroes"
    , hero = 
        { id = 1
        , name = "Windstorm" }
    }

type alias Hero =
    { id: Int
    , name: String }
