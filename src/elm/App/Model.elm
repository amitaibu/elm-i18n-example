module App.Model where

import LanguageSwitcher.Model as LanguageSwitcher exposing (initialModel, Model)
import Welcome.Model          as Welcome          exposing (initialModel, Model)


type alias Model =
  { currentLanguage : Translation.Language
  , languageSwitcher : LanguageSwitcher
  , welcome : Welcome
  }

initialModel : Model
initialModel =
  { currentLanguage : Language.English
  , languageSwitcher : LanguageSwitcher.initialModel
  , welcome : Welcome.initialModel
  }
