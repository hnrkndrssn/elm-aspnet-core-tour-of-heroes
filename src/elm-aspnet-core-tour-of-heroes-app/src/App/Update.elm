module App.Update exposing (..)

import App.Models exposing (Model)
import App.Messages exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeName newName ->
          case model.selectedHero of
            Just selectedHero ->
              let
                updatedHero = 
                  { selectedHero | name = newName, isSelected = True }

                pick currentHero =
                  if updatedHero.id == currentHero.id then
                    updatedHero
                  else
                    currentHero

                updatedHeroList heroes =
                  List.map pick heroes

                updatedModel = 
                  { model | heroes = (updatedHeroList model.heroes), selectedHero = Just updatedHero }
              in
                ( updatedModel, Cmd.none )
            Nothing ->
              ( model, Cmd.none )
        
        SelectHero hero ->
          let
            pick currentHero =
              if hero.id == currentHero.id then
                { hero | isSelected = True }
              else
                { currentHero | isSelected = False }

            updatedHeroList heroes =
              List.map pick heroes
          in
            ( { model | heroes = (updatedHeroList model.heroes), selectedHero = Just hero }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

