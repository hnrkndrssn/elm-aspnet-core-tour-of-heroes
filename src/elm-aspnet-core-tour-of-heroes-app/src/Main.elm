module Main exposing (..)

import Navigation exposing (Location)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, initialModel)
import App.Update exposing (update)
import App.View exposing (view)
import Heroes.Commands exposing (fetchHeroes)

import Routing

init : Location -> ( Model, Cmd Msg )
init location =
    let
      currentRoute =
        Routing.parseLocation location

    in
      ( initialModel currentRoute, fetchHeroes )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- MAIN

main : Program Never Model Msg
main =
  Navigation.program OnLocationChange
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
