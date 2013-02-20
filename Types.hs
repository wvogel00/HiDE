module Types where

import Graphics.UI.WX

data HiDEParam = HiDEParam {
	projectPath :: FilePath,	-- path to current project
	files		:: [FilePath],	-- files included in current projects
	changed		:: Bool			-- check the existance of files' change
	}

defaultIDEParam :: HiDEParam
defaultIDEParam = HiDEParam{
		projectPath = [],files = [],changed = False
	}
