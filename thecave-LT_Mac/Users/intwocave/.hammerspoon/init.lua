-- 입력 소스 ID
local kEnglish = "com.apple.keylayout.ABC"
local kKorean = "com.apple.inputmethod.Korean.2SetKorean"
local kJapanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"

-- f18 키에 바인딩
-- hs.hotkey.bind({}, "f18", function()
--     local current = hs.keycodes.currentSourceID()
-- 
-- 		-- 한국어 or 일본어일 때 -> 영어
--     if current == kKorean or current == kJapanese then
-- 				hs.keycodes.currentSourceID(kEnglish)
-- 
-- 		-- 영어일 때 -> 한국어
--     elseif current == kEnglish then
-- 				hs.keycodes.currentSourceID(kKorean)
--     end
-- end)

-- cmd-f18 키에 바인딩
hs.hotkey.bind({"cmd"}, "f18", function()
    local current = hs.keycodes.currentSourceID()

		-- 영어 or 한국어일 때 -> 일본어
    if current == kEnglish or current == kKorean then
				hs.keycodes.currentSourceID(kJapanese)
				
		-- 일본어일 때 -> 한국어
    elseif current == kJapanese then
				hs.keycodes.currentSourceID(kKorean)
    end
end)

-- Right Option 키 단독 입력 감지하여 한국어 입력으로 전환
local wasRightOptionDown = false

-- 주의: 가비지 컬렉션(GC)에 의해 리스너가 삭제되는 것을 막기 위해 
-- local 키워드를 빼고 전역 변수로 선언합니다.
rightOptionFlagsTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
    local keyCode = e:getKeyCode()
    local flags = e:getFlags()

    -- 61번은 우측 Option 키
    if keyCode == 61 then
        if flags.alt and not wasRightOptionDown then
            hs.keycodes.currentSourceID(kKorean)
            wasRightOptionDown = true
        elseif not flags.alt then
            wasRightOptionDown = false
        end
    end

    return false
end)

-- 리스너 실행
rightOptionFlagsTap:start()

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
	-- 첫 번째 방법
	-- hs.application.launchOrFocus("Finder") -- 제대로 작동 안 함
	
	-- 두 번째 방법
	hs.execute("open ~")

	-- 세 번째 방법
	-- local script = [[
	-- 		tell application "Finder"
	-- 				make new Finder window
	-- 				activate
	-- 		end tell
	-- 																				    
	-- ]]
	-- hs.osascript.applescript(script)
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
