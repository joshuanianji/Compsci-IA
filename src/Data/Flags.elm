module Data.Flags exposing (Flags, WindowSize, decoder)

import Data.PeriodicTable as PeriodicTable exposing (PeriodicTable)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline


type alias Flags =
    { windowSize : WindowSize
    , ptable : PeriodicTable
    , sigmaStare : String 
    }


type alias WindowSize =
    { height : Int
    , width : Int
    }



-- DECODER


decoder : Decoder Flags
decoder =
    Decode.succeed Flags
        |> Pipeline.required "windowSize" windowSize
        |> Pipeline.required "ptable" PeriodicTable.decoder
        |> Pipeline.required "sigmaStare" Decode.string


windowSize : Decoder WindowSize
windowSize =
    Decode.succeed WindowSize
        |> Pipeline.required "height" Decode.int
        |> Pipeline.required "width" Decode.int
