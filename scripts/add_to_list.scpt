set query to "{query}" -- get the query

tell application "iTunes"
	if query is "null" then
		activate -- user chose to activate iTunes
	else
		set my text item delimiters to "-"
		set actionItems to every text item of query -- actions come as 'remove||add-playlistID-trackID'
		set action to item 1 of actionItems
		set playlistID to (item 2 of actionItems) as string
		set songId to (item 3 of actionItems) as integer
		set my text item delimiters to ""
		
		set thePlaylist to item 1 of (every playlist whose persistent ID is playlistID) -- store the playlist
		set playlistName to name of thePlaylist
		set songName to "The song"
		
		try
			if action is "add" then
				set theSong to item 1 of (every track whose database ID is songId) -- store the song
				set songName to name of theSong
				duplicate theSong to thePlaylist
				return "Added to list <-" & quote & songName & quote
			else
                -- Delete song from playlist (commented)
				-- set theSong to first track of thePlaylist whose database ID is songId -- store the song
				-- set songName to name of theSong
				-- if persistent ID of current playlist is playlistID then next track
				-- tell thePlaylist
				-- 	delete theSong
				-- end tell
				-- return quote & songName & quote & " removed from playlist " & quote & playlistName & quote
				return "Already in list <-" & quote & songName & quote
			end if
		on error
			if action is "add" then
				return "Oops. " & quote & songName & quote & " couldn't be added to playlist " & quote & playlistName & quote
			else
				return "Oops. " & quote & songName & quote & " couldn't be removed from playlist " & quote & playlistName & quote
			end if
		end try
		
	end if
end tell
