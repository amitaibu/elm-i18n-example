module App.View where

import App.Model as App exposing (initialModel, Model)
import App.Update exposing (init, Action)

import Html exposing (a, div, h2, i, li, node, span, text, ul, button, Html)
import Html.Attributes exposing (class, classList, id, href, style, target, attribute)
import Html.Events exposing (onClick)

view : Signal.Address Action -> Model -> Html
view address model =
  let
    languageSwitcherAddress =
      Signal.forwardTo address App.Update.ChildLanguageSwitcherAction

    welcomeAddress =
      Signal.forwardTo address App.Update.ChildWelcomeAction
  in
    div
      []
      [ div [] [ LanguageSwitcher.View.view context childAddress model.languageSwitcher ]
      , div [] [ Welcome.View.view model.currentLanguage welcomeAddress model.welcome ]
      ]
