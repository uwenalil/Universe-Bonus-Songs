function onCreatePost()
    setProperty("gf.visible", false)
    setProperty("dad.visible", false)

    makeLuaText("watermark", "@weirdpersontbh.bsky.social / on bsky\n@uwenalil / on yt\nPLEASE GIVE CREDIT IF USE CHART/GAMEPLAY", 700, (screenWidth/2)-(700/2), screenHeight/2)
    setProperty("watermark.alpha", 0.25)
    setTextSize("watermark", 21)
    addLuaText("watermark")
end