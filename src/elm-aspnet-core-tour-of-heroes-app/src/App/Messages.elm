module App.Messages exposing (..)

import Heroes.Models exposing (Hero)

type Msg
  = SelectHero Hero
  | ChangeName String
  | NoOp
