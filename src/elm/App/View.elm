module App.View where

import App.Model as App exposing (initialModel, Model)
import App.Update exposing (init, Action)

import Html exposing (a, div, h2, i, li, node, span, text, ul, button, Html)
import Html.Attributes exposing (class, classList, id, href, style, target, attribute)
import Html.Events exposing (onClick)


type alias Page = App.Page

view : Signal.Address Action -> Model -> Html
view address model =
  let
    childAddress =
      Signal.forwardTo address App.Update.ChildEventAction

    context =
      { companies = model.companies }
  in
    div
      []
      [ LanguageSwitcher.View.view context childAddress model.languageSwitcher
      ]
