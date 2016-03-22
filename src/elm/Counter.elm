module Counter where

import Effects exposing (Effects)
import Html exposing (div, text, Html)
import String.Interpolate exposing (interpolate)

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

type alias TranslationArguments = List String

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

translate : Language -> Translation -> TranslationArguments -> String
translate lang trans args =
  let
    translationSet =
      case trans of
        Login       -> TranslationSet "Please login" "Por favor login"
        WelcomeBack -> TranslationSet "Welcome back {0}" "Bienvenido {0}"
  in
    case lang of
      English -> interpolate (.english translationSet) args
      Spanish -> interpolate (.spanish translationSet) args


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ div [] [text <| translate English Login []]
    , div [] [text <| translate Spanish Login []]
    , div [] [text <| translate English WelcomeBack ["amitaibu"]]
    , div [] [text <| translate Spanish WelcomeBack ["amitaibu"]]
    ]
