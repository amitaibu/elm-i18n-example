
import Effects exposing (Never)
import I18nExample exposing (init, update, view)
import StartApp
import Task


app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = []
    }


main =
  app.html


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks
