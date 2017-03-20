module Main exposing (..)

import Html exposing (Html, div, text, program)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, initialModel)
import App.Update exposing (update)
import App.View exposing (view)

init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )

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
