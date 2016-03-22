module Counter where

import Effects exposing (Effects)
import Html exposing (..)

-- MODEL

type alias Model = Int

initialModel : Model
initialModel = 0

init : (Model, Effects Action)
init =
  ( initialModel
  , Effects.none
  )


-- UPDATE

type Action = NoOp

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp ->
      ( model, Effects.none)

-- i18n


type alias TranslationSet =
  { english : String
  , spanish : String
  }

type Translation
  = Login
  | WelcomeBack

type Language
  = English
  | Spanish

translate : Language -> Translation -> String
translate lang trans =
  let
    set =
      case trans of
        Login       -> TranslationSet "Please login" "Por favor login"
        WelcomeBack -> TranslationSet "Welcome back {0}" "Bienvenido {0}"
  in
    case lang of
      English -> .english set
      Spanish -> .spanish set


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ div [] [text <| translate English Login]
    , div [] [text <| translate Spanish Login]
    ]
