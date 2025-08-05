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
