{-# LANGUAGE OverloadedStrings  #-}

module Pages 
(
      renderText
    , mainPage
)
where
import              Text.Blaze.Html5                    
import qualified    Text.Blaze.Html5                    as H
import              Text.Blaze.Html5.Attributes       
import qualified    Text.Blaze.Html5.Attributes         as A
import qualified    Data.Text.Lazy                      as T

import              Data.Monoid                         



renderText :: T.Text -> Html
renderText txt = H.html $ H.body $ p $ toHtml txt

template :: T.Text -> Html -> Html
template t b = do 
    html $ do 
        H.head $ H.title $ toHtml t
        body b

mainPage :: Html
mainPage = template "Hello World!" $ do
    p $ "Hello World"  
    a ! href "https://github.com/frankhucek" $ "My Github"
    H.form ! action "http://frankhucek.com:1313" ! method "get" $ 
        input ! type_ "submit" ! value "Click" -- ! name "Submit"
