module Heroes.Models exposing (..)

heroes : List Hero
heroes =
    [
        Hero 11 "Mr. Nice" False,
        Hero 12 "Narco" False,
        Hero 13 "Bombasto" False,
        Hero 14 "Celeritas" False,
        Hero 15 "Magneta" False,
        Hero 16 "RubberMan" False,
        Hero 17 "Dynama" False,
        Hero 18 "Dr IQ" False,
        Hero 19 "Magma" False,
        Hero 20 "Tornado" False
    ]

type alias Hero =
    { id: Int
    , name: String
    , isSelected: Bool }
