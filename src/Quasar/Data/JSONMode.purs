{-
Copyright 2016 SlamData, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-}

module Quasar.Data.JSONMode where

import Prelude

import Data.MediaType (MediaType(..))

data JSONMode = Readable | Precise

derive instance eqJSONMode ∷ Eq JSONMode

derive instance ordJSONMode ∷ Ord JSONMode

instance showJSONMode ∷ Show JSONMode where
  show Readable = "Readable"
  show Precise = "Precise"

decorateMode ∷ MediaType → JSONMode → MediaType
decorateMode (MediaType mt) mode = MediaType (mt <> modeToString mode)
  where
  modeToString Readable = ";mode=readable"
  modeToString Precise = ";mode=precise"
