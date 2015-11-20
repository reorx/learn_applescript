on run {input, parameters}
	-- display alert (class of input)
	-- Since input is a list, we should convert it to string before processing
	repeat with ii in input
		set selected to ii
	end repeat
	-- display alert (class of selected)
	-- display alert selected

	-- Encode selected
	set cmd to "python -c 'import urllib, sys; print urllib.quote(sys.argv[1])'" & " " & quoted form of selected
	-- display alert cmd
	set encoded to do shell script cmd
	-- display alert encoded

	-- Form the search url
	set prefix to "spotify:search:"
	set search_url to prefix & encoded
	-- set search_url to "spotify:search:test"

	-- Open in Spotify
	tell application "Spotify"
		activate
		open location search_url
	end tell

	return input
end run
