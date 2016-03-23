module App.Update where

import App.Model as App exposing (initialModel, Model)
import Effects exposing (none)

init : (Model, Effects Action)
init =
  ( App.initialModel
  , Effects.none
  )

type Action
  = NoOp
  | SetLanguage Language

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp ->
      (model, Effects.none)

    SetLanguage lang ->
      ( {model | language = lang}
      , Effects.none
      )
