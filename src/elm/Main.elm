import App.Model as App exposing (Model)
import App.Router exposing (delta2update, location2action)
import App.Update exposing (init, update)
import App.View exposing (view)
import StartApp as StartApp
import Task exposing (Task)


app =
  StartApp.start
    { init = App.Update.init
    , update = App.Update.update
    , view = App.View.view
    , inputs =
        [ messages.signal
        , Signal.map (App.Update.ChildArticleAction << Pages.Article.Update.ChildArticleFormAction << ArticleForm.Update.SetImageId) dropzoneUploadedFile
        , Signal.map (App.Update.ChildArticleAction << Pages.Article.Update.ChildArticleFormAction << ArticleForm.Update.UpdateBody) ckeditor
        , Signal.map (App.Update.ChildEventAction << Pages.Event.Update.ChildEventListAction << EventList.Update.SelectEvent) selectEvent
        ]
    }

main =
  app.html
