module App.Messages exposing (..)

import App.Models exposing (Hero)

type Msg
  = SelectHero Hero
  | ChangeName String
  | NoOp
