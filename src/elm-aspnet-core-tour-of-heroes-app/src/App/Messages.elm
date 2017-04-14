module App.Messages exposing (..)

import RemoteData exposing (WebData)
import Navigation exposing (Location)

import Heroes.Models exposing (Hero)

type Msg
  = HeroesLoaded (WebData (List Hero))
  | SelectHero Hero
  | ChangeName String
  | GoBack Int
  | ChangeLocation String
  | OnLocationChange Location
