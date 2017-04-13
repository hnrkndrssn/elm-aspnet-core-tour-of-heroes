module App.Update exposing (..)

import RemoteData exposing (WebData)
import Routing exposing (parseLocation)
import Navigation

import App.Models exposing (Model, Route(..))
import App.Messages exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        HeroesLoaded heroes ->
          ( { model | heroes = (RemoteData.toMaybe heroes) }, Cmd.none )

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
                  case heroes of

                    Just heroes ->
                      List.map pick heroes
                    
                    Nothing ->
                      []

                updatedModel = 
                  { model | heroes = Just (updatedHeroList model.heroes), selectedHero = Just updatedHero }
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
              case heroes of

                Just heroes ->
                  List.map pick heroes
                
                Nothing ->
                  []
          in
            ( { model | heroes = Just (updatedHeroList model.heroes), selectedHero = Just hero }, Cmd.none )

        ChangeLocation path ->
          ( model, Navigation.newUrl path )

        OnLocationChange location ->
          let
            newRoute =
              Routing.parseLocation location

            cmd =
              Routing.route2Cmd newRoute
          in
                ( { model | route = newRoute }, cmd )