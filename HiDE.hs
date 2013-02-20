import Graphics.UI.WX
import Graphics.UI.WX.Dialogs
import Graphics.UI.WX.Controls
import Types

main = start ide

ide = do
	param <- varCreate defaultIDEParam --data whith treated in HiDE

	f <- frame[text := "HiDE"]
	p <- panel f []
	ms <- mkMenubar f param
	editArea <- textCtrlRich p [size := sz 600 400]
	messageArea <- textCtrlRich p [size := sz 200 400]
	fileManager <- textCtrlRich p [size := sz 200 400]

	set f ms
	set f [	layout :=container p $ column 0
			[margin 0 $ minsize (sz 800 400) $ widget editArea
            ,(margin 5 $ row 2 [widget messageArea,widget fileManager])]
			,clientSize := Size 1000 600]

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
			on (menu fOpen) := fileopen f param,
			on (menu fNew) := do return (),
			on (menu fSave) := return (),
			on (menu fSaveAs) := return (),
			on (menu fClose) := return (),
			on (menu eRedo) := return (),
			on (menu eUndo) := return (),
			on (menu bBuild) := return (),
			on (menu bExecute) := return ()
		]

fileopen f param = do
	path <- fileOpenDialog f True True "Open Project" [("Haskell file",["*.hs"])] "" ""
	case path of
		Nothing -> return ()
		Just str -> do
			varUpdate param (\param' -> param' {projectPath = str})
			return ()
