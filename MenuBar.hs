module MenuBar where

import Graphics.UI.WX
import MenuBar.Action
import Types

mkMenubar f param = do
		file <- menuPane [text:="&File"]
		fOpen <- menuItem file [text := "Open"]
		fNew <- menuItem file [text := "New"]
		fSave <- menuItem file [text := "Save"]
		fSaveAs <- menuItem file [text := "Save As"]
		fClose <- menuItem file [text := "Close" ]

		edit <- menuPane [text:="&Edit"]
		eRedo <- menuItem edit [text := "Redo"]
		eUndo <- menuItem edit [text := "Undo"]

		build <- menuPane [text:="&Build"]
		bBuild <- menuItem build [text := "Compile"]
		bExecute <- menuItem build [text := "Do"]

		help <- menuPane [text:="&Help"]
		hHelp <- menuItem help [text := "Compile"]

		return [menuBar := [file,edit,build,help],
				on (menu fOpen) := do
					path <- fileopen f
					varUpdate param (\p' -> p' {projectPath =path})
					return (),
				on (menu fNew) := do return (),
				on (menu fSave) := return (),
				on (menu fSaveAs) := return (),
				on (menu fClose) := return (),
				on (menu eRedo) := return (),
				on (menu eUndo) := return (),
				on (menu bBuild) := return (),
				on (menu bExecute) := return ()
				]
