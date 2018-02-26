{-# LANGUAGE OverloadedStrings #-}

module Main where

import Reflex.Dom

import Reflex.Dom.Plaid.Link


main :: IO ()
main = mainWidgetWithHead headSection $ do
  go <- button "Open Plaid Dialog"
  done <- plaidLinkDialog (PlaidLinkConfig
    { _plaidLinkConfig_clientName = "Test"
    , _plaidLinkConfig_env = PlaidLinkEnvironment_Sandbox
    , _plaidLinkConfig_publicKey = error "SUPPLY PUBLIC KEY HERE"
    , _plaidLinkConfig_products = [PlaidLinkProduct_Transactions]
    } <$ go)

  display =<< holdDyn "Not done" (show <$> done)

  where
    headSection :: DomBuilder t m => m ()
    headSection =
      elAttr "script" ("src"=:"https://cdn.plaid.com/link/v2/stable/link-initialize.js") blank
