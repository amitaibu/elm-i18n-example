module Welcome.View where

import Html exposing (div, text, Html)
import Translation.Utils exposing (..)


view : Language -> Html
view lang =
  div []
    [ div [] [text <| translate lang Login]
    , div [] [text <| translate lang Login]
    , div [] [text <| translate lang <| WelcomeBack {name = "amitaibu"}]
    , div [] [text <| translate lang <| WelcomeBack {name = "amitaibu"}]
    ]
