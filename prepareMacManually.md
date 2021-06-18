# System preferrence
- Dock -> Auto Hide

# iTerm preferrence
- General -> Selection -> Application in terminal may access clipboard
- Profiles -> Text -> Font -> Size: 15(4K)
- Profiles -> Termnial -> Scrollback lines -> 10000000
- Profiles -> Keys -> Key Mappings -> Add: Option + <- => send escape [1;5C (move word forword)
- Profiles -> Keys -> Key Mappings -> Add: Option + -> => send escape [1;5D (move word back)
- Profiles -> Keys -> Key Mappings -> Add: Option + Shift + <- => send hex 0x1 (home key)
- Profiles -> Keys -> Key Mappings -> Add: Option + Shift + -> => send hex 0x5 (end key)

# Shell
- Add `bindkey \^U backward-kill-line` to `~/.zshrc`
