{- Rabobank - Convert Rabobank CSV exports to QIF files
   Copyright (C) 2012 Sander Venema <sander.venema@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. -}

module Main where

import Rabobank (toQif, baseName)
import System.Environment (getArgs, getProgName)
import System.Exit (exitFailure)
import System.IO (hPutStrLn, stderr)

main :: IO ()
main = do
    input <- getArgs
    case input of
        [fileName] -> do
            file <- readFile fileName
            outfile <- baseName -- creates a timestamped basename, with "Rabobank_" prefix
            writeFile outfile (toQif file)

        _ -> do
            name <- getProgName
            hPutStrLn stderr $ "Usage: " ++ name ++ " <input file name>"
            exitFailure
