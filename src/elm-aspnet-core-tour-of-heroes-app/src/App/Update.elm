module App.Update exposing (..)

import RemoteData exposing (WebData)
import Routing exposing (parseLocation)
import Navigation

import App.Models exposing (Model, Route(..))
import App.Messages exposing (Msg(..))
import Heroes.Models exposing (Hero)

getSelectedHero : Maybe (List Hero) -> Route -> Maybe Hero
getSelectedHero maybeHeroes route =
    case route of

      HeroRoute heroId ->
        case maybeHeroes of

          Just heroesList ->
            List.head (List.filter(\hero -> hero.id == heroId) heroesList)

          Nothing ->
            Nothing
      _ ->
        Nothing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        HeroesLoaded heroes ->
          let
            maybeHeroes = (RemoteData.toMaybe heroes)
          in
            ( { model | heroes = maybeHeroes, selectedHero = getSelectedHero maybeHeroes model.route }, Cmd.none )
        
        GoBack n ->
          let
            clearSelection hero =
              { hero | isSelected = False }

            updatedHeroes =
              case model.heroes of
                
                Just heroes ->
                  List.map clearSelection heroes

                Nothing ->
                  []
          in
            ( { model | heroes = Just updatedHeroes }, Navigation.back n)

        ChangeName newName ->
          case model.selectedHero of
            Just selectedHero ->
              let
                updatedHero = 
                  { selectedHero | name = newName }

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
            
          in
              ( { model | route = newRoute, selectedHero = getSelectedHero model.heroes newRoute }, Cmd.none )