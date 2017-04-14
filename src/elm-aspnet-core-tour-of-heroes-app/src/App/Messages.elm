module App.Messages exposing (..)

import RemoteData exposing (WebData)
import Navigation exposing (Location)

import Heroes.Models exposing (Hero)

type Msg
  = HeroesLoaded (WebData (List Hero))
  | TopHeroesLoaded (WebData (List Hero))
  | SelectHero Hero
  | ChangeName String
  | ChangeLocation String
  | OnLocationChange Location
