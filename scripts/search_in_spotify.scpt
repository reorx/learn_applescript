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
set cmd to "python -c 'import urllib, sys; print urllib.quote(sys.argv[1])'" & " " & quoted form of selected
-- display alert cmd
set selected_encoded to do shell script cmd

-- Form the search url
set prefix to "spotify:search:"
set search_url to prefix & selected_encoded
-- set search_url to "spotify:search:test"
-- display dialog search_url

-- Open in Spotify
tell application "Spotify"
	activate
	open location search_url
end tell
