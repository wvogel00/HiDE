module MenuBar.Action where

import Graphics.UI.WX.Dialogs

fileopen f = do
		path <- fileOpenDialog f True True "Open Project" [("Haskell file",["*.hs"])] "" ""
		case path of
			Nothing -> return ""
			Just str -> return str
