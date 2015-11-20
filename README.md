# Learn AppleScript

Notes & code pieces recorded during my exploration to AppleScript.


## Snippets


### Strike keys in any situation

```
tell application "System Events"
    -- Strike a return key
    keystroke return

    -- Strike ⌘ + C
   keystroke "c" using command down
end tell
```

### Open url in Safari

```
tell application "Safari"
    -- `activate` will bring Safari to front, could be removed otherwise
    activate

    -- Open url in current tab
    set URL of document 1 to "https://www.baidu.com/s?word=a"
end tell
```

### Open url scheme in any application

```
tell application "Spotify"
    activate
    open location "spotify:search:hello"
end tell
```

### Set clipboard to a variable

```
set myvar to the clipboard
```

### Display dialog & alert

```
display dialog myvar
```

### Url encode a variable

```
set encoded to do shell script "python -c 'import urllib; print urllib.quote(\"" & myvar & "\")'"
```

### Tell current application

```
tell application (path to frontmost application as text)
    ...
end tell
```
