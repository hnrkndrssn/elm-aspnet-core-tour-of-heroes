module App.Update exposing (..)

import App.Models exposing (Model)
import App.Messages exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeName newName ->
            let
              hero = model.hero
              updatedHero = 
                { hero | name = newName }
                
              updatedModel = 
                { model | hero = updatedHero }
            in
              ( updatedModel, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

