-- Get selected test
tell application "System Events"
	keystroke "c" using command down
	delay 0.5
end tell

set selected to the clipboard
-- display dialog selected

if selected as string is equal to "" then
	display dialog "empty string"
	return
end if

-- Encode selected
set selected_encoded to do shell script "python -c 'import urllib; print urllib.quote(\"" & selected & "\")'"


-- Form the search url
set prefix to "spotify:search:"
set search_url to prefix & selected_encoded
set _search_url to "spotify:search:test"
-- display dialog search_url


-- Open in Spotify
tell application "Spotify"
	activate
	open location search_url
end tell
