import Graphics.UI.WX
import Graphics.UI.WX.Controls

main = start ide

ide = do
	f <- frame[text := "HiDE"]
	p <- panel f []
	ms <- mkMenubar
	editArea <- textCtrlRich p [size := sz 600 400]
	messageArea <- textCtrlRich p [size := sz 200 400]
	fileManager <- textCtrlRich p [size := sz 200 400]

	set f ms
	set f [	layout :=container p $ column 0
			[margin 30 $ widget editArea
            ,(margin 5 $ row 2 [widget messageArea,widget fileManager])]
			,clientSize := Size 1000 600]

mkMenubar = do
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
			on (menu fOpen) := return (),
			on (menu fNew) := return (),
			on (menu fSave) := return (),
			on (menu fSaveAs) := return (),
			on (menu fClose) := return (),
			on (menu eRedo) := return (),
			on (menu eUndo) := return (),
			on (menu bBuild) := return (),
			on (menu bExecute) := return ()
		]
