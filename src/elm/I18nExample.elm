module I18nExample where

import Effects exposing (Effects)
import Html exposing (div, text, Html)

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
  | WelcomeBack {name : String}

type Language
  = English
  | Spanish

translate : Language -> Translation -> String
translate lang trans =
  let
    translationSet =
      case trans of
        Login ->
          TranslationSet "Please login" "Por favor login"

        WelcomeBack val ->
          TranslationSet ("Welcome back " ++ val.name) ("Bienvenido "  ++ val.name)
  in
    case lang of
      English -> .english translationSet
      Spanish -> .spanish translationSet


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ div [] [text <| translate English Login]
    , div [] [text <| translate Spanish Login]
    , div [] [text <| translate English <| WelcomeBack {name = "amitaibu"}]
    , div [] [text <| translate Spanish <| WelcomeBack {name = "amitaibu"}]
    ]
