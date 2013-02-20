import Graphics.UI.WX
import Graphics.UI.WX.Dialogs
import Graphics.UI.WX.Controls
import Types
import MenuBar

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
