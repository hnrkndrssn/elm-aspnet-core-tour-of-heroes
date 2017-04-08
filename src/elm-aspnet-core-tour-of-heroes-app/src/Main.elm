module Main exposing (..)

import Html exposing (Html, div, text, program)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, initialModel)
import App.Update exposing (update)
import App.View exposing (view)
import Heroes.Commands exposing (fetchHeroes)

init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchHeroes )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- MAIN

main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
