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

-- |The 'ListUtils' module contains some of the list helper functions I've
-- written.
module ListUtils (takeWhileIndex, dropWhileIndex) where

import Data.List (elem, elemIndex, nub)
import Data.Maybe (fromJust)

-- |The 'dropWhileIndex' helper function will take a '[Int]' of indices
-- and a list, and returns a list without the elements with any one of the
-- supplied indices. So if you want to drop item 0 and 1 from a list, you can
-- do the following:
--
-- > dropWhileIndex [0,1] ["this", "is", "a", "list"] 
--
-- and the function will return the list:
--
-- > ["a", "list"] 
--
-- The advantage of this function with regards to 'drop' etc. is that
-- this function will also drop non-consecutive indices.
dropWhileIndex :: (Eq a) => [Int] -> [a] -> [a]
dropWhileIndex indices list = nub $ filter isIndex list
    where isIndex e = let curIndex = fromJust (elemIndex e list)
                      in curIndex `notElem` indices

-- |The 'takeWhileIndex' helper function will take a '[Int]' of indices
-- and a list, and returns a list containing only the elements with any one of
-- the supplied indices. So if you want to take item 0 and 1 of a list, you can
-- do the following:
--
-- > takeWhileIndex [0,1] ["this", "is", "a", "list"] 
--
-- and the function will return the list:
--
-- > ["this", "is"] 
--
-- The advantage of this function with regards to 'take' etc. is that
-- this function will also take non-consecutive indices.
takeWhileIndex :: (Eq a) => [Int] -> [a] -> [a]
takeWhileIndex indices list = nub $ filter isIndex list
    where isIndex e = let curIndex = fromJust (elemIndex e list)
                      in curIndex `elem` indices
