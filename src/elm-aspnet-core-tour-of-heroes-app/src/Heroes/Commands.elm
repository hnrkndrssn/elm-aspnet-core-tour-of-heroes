module Heroes.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import RemoteData

import App.Messages exposing (Msg(..))
import Heroes.Models exposing (Hero)

heroesUrl : String
heroesUrl =
    "src/Heroes/Heroes.json"

fetchHeroes : Cmd Msg
fetchHeroes =
    Http.get heroesUrl heroesDecoder
        |> RemoteData.sendRequest
        |> Cmd.map HeroesLoaded

heroesDecoder : Decode.Decoder (List Hero)
heroesDecoder =
    Decode.list heroDecoder

heroDecoder : Decode.Decoder Hero
heroDecoder =
    decode Hero
        |> required "id" Decode.int
        |> required "name" Decode.string
        |> optional "isSelected" Decode.bool False