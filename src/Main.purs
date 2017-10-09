module Main where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe (Maybe(..))
import Node.Encoding (Encoding(..))
import Node.HTTP (HTTP, ListenOptions, Request, Response, createServer, listen, responseAsStream, setStatusCode, setStatusMessage)
import Node.Stream (end, writeString)
import Prelude (Unit, bind, discard, pure, unit)


app :: forall eff. Request -> Response -> Eff (http :: HTTP, console :: CONSOLE | eff) Unit
app req res = do
  let outputStream = responseAsStream res
  setStatusCode res 200
  setStatusMessage res "OK dokey"
  _ <- writeString outputStream UTF8 "Yay!" (pure unit)
  end outputStream (pure unit)
  log "."
  pure unit


listenOptions :: ListenOptions
listenOptions = { hostname: "0.0.0.0", port: 8000, backlog: Nothing }

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
main :: forall e. Eff ( http :: HTTP , console :: CONSOLE | e ) Unit
main = do
  s <- createServer app
  listen s listenOptions (log "🔋 ready")
