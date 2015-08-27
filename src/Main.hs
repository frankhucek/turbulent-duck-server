{-# LANGUAGE OverloadedStrings  #-}

module Main where
import              Text.Blaze.Html.Renderer.Text       (renderHtml)
import              Web.Scotty                          as S

import              Text.Blaze.Html5                    hiding(main)
import qualified    Text.Blaze.Html5                    as H
import              Text.Blaze.Html5.Attributes       
import qualified    Text.Blaze.Html5.Attributes         as A
import qualified    Data.Text.Lazy                      as T

import              Data.Monoid         

import              Pages
import              Control.Monad.IO.Class

main = scotty 80 $ do
    S.get "/" $ blaze $ mainPage 
    S.get "/echo/:word" $ do
        x <- S.param "word"
        blaze $ renderText $ "Something involving" <> x
    S.get "/anotherpage" $ blaze $ renderText "Hello again" 
       

   --S.get "/" $ S.html "Hello World"
    --get and post requests


blaze = S.html . renderHtml


