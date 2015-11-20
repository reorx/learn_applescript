on run {input, parameters}
	set selected to input

	-- Encode selected
	set encoded to do shell script "python -c 'import urllib; print urllib.quote(\"" & selected & "\")'"

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
