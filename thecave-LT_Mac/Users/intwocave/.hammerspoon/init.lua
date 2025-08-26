-- f18 키에 바인딩
hs.hotkey.bind({}, "f18", function()
    local current = hs.keycodes.currentSourceID()

    if current == "com.apple.inputmethod.Korean.2SetKorean" or current == "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese" then
        -- 한국어 or 일본어일 때 -> 영어
        hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    elseif current == "com.apple.keylayout.ABC" then
        -- 영어일 때 -> 한국어
        hs.keycodes.currentSourceID("com.apple.inputmethod.Korean.2SetKorean")
    end
end)

-- cmd-f18 키에 바인딩
hs.hotkey.bind({"cmd"}, "f18", function()
    local current = hs.keycodes.currentSourceID()

    if current == "com.apple.keylayout.ABC" or current == "com.apple.inputmethod.Korean.2SetKorean" then
        -- 영어 or 한국어일 때 -> 일본어
        hs.keycodes.currentSourceID("com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
    elseif current == "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese" then
        -- 일본어일 때 -> 한국어
        hs.keycodes.currentSourceID("com.apple.inputmethod.Korean.2SetKorean")
    end
end)


-- Windows shortcuts --

-- Full screen toggle
hs.hotkey.bind({}, "F11", function()
	local win = hs.window.focusedWindow()
	if win then
		win:toggleFullScreen()
	end
end)


-- Application shortcuts --

-- Command + Control + T로 iTerm2 단축 실행
hs.hotkey.bind({"cmd", "ctrl"}, "T", function()
	-- 새 창에서 새로 열기
	hs.task.new("/usr/bin/open", nil, {"-na", "iTerm"}):start()
end)

-- Control + Command + F로 Finder 단축 실행
hs.hotkey.bind({"cmd", "ctrl"}, "F", function()
	-- Finder 실행 (없으면 실행, 있으면 활성화)
	hs.application.launchOrFocus("Finder")
end)

-- Control + Shift + C로 Firefox 단축 실행
hs.hotkey.bind({"ctrl", "shift"}, "C", function()
	-- 새 창에서 새로 열기
	hs.task.new("/usr/bin/open", nil, {"-na", "Firefox"}):start()
end)

-- Command + Control + E로 Notion 단축 실행
hs.hotkey.bind({"cmd", "ctrl"}, "E", function()
	-- Notion 실행 (없으면 실행, 있으면 활성화)
	hs.application.launchOrFocus("Notion")
end)

-- Control + Shift + D로 Discord 단축 실행
hs.hotkey.bind({"ctrl", "shift"}, "D", function()
	-- Discord 실행 (없으면 실행, 있으면 활성화)
	hs.application.launchOrFocus("Discord")
end)

-- Command + Control + Shift + D로 Discord MI 단축 실행
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "D", function()
	-- 새 창에서 새로 열기
	hs.task.new("/usr/bin/open", nil, {"-na", "Discord", "--args", "--multi-instance"}):start()
end)

-- Command + Control + Shift + E로 Mail 단축 실행
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "E", function()
	-- Mail 실행 (없으면 실행, 있으면 활성화)
	hs.application.launchOrFocus("Mail")
end)
