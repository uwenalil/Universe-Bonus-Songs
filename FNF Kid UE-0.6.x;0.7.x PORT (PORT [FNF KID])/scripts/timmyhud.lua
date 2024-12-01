local timmy = "timmyHud"
local spacing1 = 26

local sicks = 0
local goods = 0
local bads = 0
local ohuhs = 0

local StartingHudX = -100
local TweeningHudX = 30
local TweeningHudDur = 1

local ZoomHudDur = 0.25

function onCreatePost()
    setProperty("scoreTxt.visible", false)
    setProperty("timeBar.visible", false)
    setProperty("timeTxt.visible", false)

    makeLuaText(timmy .. "ScoreAndRating", "Score: 0 / Rating: 0 (N/A)", 500, (screenWidth / 2) - (500 / 2), 731)
    if downscroll then
        setProperty(timmy .. "ScoreAndRating.y", -31)
    end
    setTextFont(timmy .. "ScoreAndRating", "funkin.ttf")
    setTextAlignment(timmy .. "ScoreAndRating", "center")
    setTextSize(timmy .. "ScoreAndRating", 21)
    addLuaText(timmy .. "ScoreAndRating")

    makeLuaText(timmy .. "Sick", "Sick: 0", 0, StartingHudX, screenHeight / 2 - spacing1 - spacing1)
    setTextFont(timmy .. "Sick", "funkin.ttf")
    setTextAlignment(timmy .. "Sick", "left")
    setTextSize(timmy .. "Sick", 21)
    addLuaText(timmy .. "Sick")

    makeLuaText(timmy .. "Good", "Good: 0", 0, StartingHudX, screenHeight / 2 - spacing1)
    setTextFont(timmy .. "Good", "funkin.ttf")
    setTextAlignment(timmy .. "Good", "left")
    setTextSize(timmy .. "Good", 21)
    addLuaText(timmy .. "Good")

    makeLuaText(timmy .. "Bad", "Bad: 0", 0, StartingHudX, screenHeight / 2)
    setTextFont(timmy .. "Bad", "funkin.ttf")
    setTextAlignment(timmy .. "Bad", "left")
    setTextSize(timmy .. "Bad", 21)
    addLuaText(timmy .. "Bad")

    makeLuaText(timmy .. "OhUh", "Oh Uh: 0", 0, StartingHudX, screenHeight / 2 + spacing1)
    setTextFont(timmy .. "OhUh", "funkin.ttf")
    setTextAlignment(timmy .. "OhUh", "left")
    setTextSize(timmy .. "OhUh", 21)
    addLuaText(timmy .. "OhUh")

    makeLuaText(timmy .. "Miss", "Miss: 0", 0, StartingHudX, screenHeight / 2 + spacing1 + spacing1)
    setTextFont(timmy .. "Miss", "funkin.ttf")
    setTextAlignment(timmy .. "Miss", "left")
    setTextSize(timmy .. "Miss", 21)
    addLuaText(timmy .. "Miss")

    makeLuaSprite(timmy .. 'clock', 'clocktuah', 0, 60)
    if downscroll then
        setProperty(timmy .. "clock.y", 580)
    end
    setObjectCamera(timmy .. "clock", "camHUD")
    scaleObject(timmy .. "clock", 0.6, 0.6)
    screenCenter(timmy .. 'clock', "x")
    addLuaSprite(timmy .. 'clock', true)
    setProperty(timmy .. "clock.alpha", 0)

    makeLuaText(timmy .. "ClockText", "0:00 - 0:00", 500, 0, 95)
    if downscroll then
        setProperty(timmy .. "ClockText.y", 615)
    end
    screenCenter(timmy .. "ClockText", "x")
    setTextFont(timmy .. "ClockText", "funkin.ttf")
    setTextAlignment(timmy .. "ClockText", "center")
    setTextSize(timmy .. "ClockText", 21)
    addLuaText(timmy .. "ClockText")
    setProperty(timmy .. "ClockText.alpha", 0)

    if middlescroll then
        setProperty(timmy .. "ClockText.x", getProperty(timmy.. "ClockText.x") - 500)
        setProperty(timmy .. "clock.x", getProperty(timmy.. "clock.x") - 500)
    end

    -- setProperty("healthBar.scale.x", 0)
    -- runTimer("smoothEnterHP", 1)

    -- runTimer("smoothEnterSicks", 0.25)
    -- runTimer("smoothEnterGoods", 0.3)
    -- runTimer("smoothEnterBads", 0.35)
    -- runTimer("smoothEnterOhUhs", 0.4)
    -- runTimer("smoothEnterMiss", 0.5)
    -- runTimer("smoothEnterScoreRating", 0.55)
end

function onUpdate(elapsed)
    if hits > 0 or misses > 0 then
        setTextString(timmy .. "ScoreAndRating",
            "Score: " .. score .. " / Rating: " .. round(rating * 100, 2) .. "% (" .. ratingFC .. ")")
        setTextString(timmy .. "Sick", "Sick: " .. sicks)
        setTextString(timmy .. "Good", "Good: " .. goods)
        setTextString(timmy .. "Bad", "Bad: " .. bads)
        setTextString(timmy .. "OhUh", "Oh Uh: " .. ohuhs)
        setTextString(timmy .. "Miss", "Miss: " .. misses)
    end
    setTextString(timmy .. 'ClockText', formatTime(getSongPosition() - noteOffset) .. ' - ' .. formatTime(songLength))
end

function onSongStart()
    doTweenAlpha("timmyClockSpriteAppear", timmy .. "clock", 1, 0.5, "linear")
    doTweenAlpha("timmyClockTextAppear", timmy .. "ClockText", 1, 0.5, "linear")
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    local rawNoteRating = getPropertyFromGroup('notes', membersIndex, 'rating')
    if rawNoteRating == "sick" then
        sicks = sicks + 1

        setProperty(timmy .. "Sick.scale.x", 1.2)
        setProperty(timmy .. "Sick.scale.y", 1.2)

        doTweenX("timmyzoomsick X", timmy .. "Sick.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoomsick Y", timmy .. "Sick.scale", 1, ZoomHudDur, "linear")
    elseif rawNoteRating == "good" then
        goods = goods + 1

        setProperty(timmy .. "Good.scale.x", 1.2)
        setProperty(timmy .. "Good.scale.y", 1.2)

        doTweenX("timmyzoomgood X", timmy .. "Good.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoomgood Y", timmy .. "Good.scale", 1, ZoomHudDur, "linear")
    elseif rawNoteRating == "bad" then
        bads = bads + 1

        setProperty(timmy .. "Bad.scale.x", 1.2)
        setProperty(timmy .. "Bad.scale.y", 1.2)

        doTweenX("timmyzoombad X", timmy .. "Bad.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoombad Y", timmy .. "Bad.scale", 1, ZoomHudDur, "linear")
    elseif rawNoteRating == "shit" then
        ohuhs = ohuhs + 1

        setProperty(timmy .. "OhUh.scale.x", 1.2)
        setProperty(timmy .. "OhUh.scale.y", 1.2)

        doTweenX("timmyzoomohuh X", timmy .. "OhUh.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoomohuh Y", timmy .. "OhUh.scale", 1, ZoomHudDur, "linear")

        setProperty(timmy .. "OhUh.color", getColorFromHex("A0A0A0"))
        doTweenColor("timmycolorohuh", timmy .. "OhUh", "FFFFFF", ZoomHudDur, "linear")
    end

    if not isSustainNote then
        setProperty(timmy .. "ScoreAndRating.scale.x", 1.1)
        setProperty(timmy .. "ScoreAndRating.scale.y", 1.1)

        doTweenX("timmyzoomsickandrating X", timmy .. "ScoreAndRating.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoomsickandrating Y", timmy .. "ScoreAndRating.scale", 1, ZoomHudDur, "linear")
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        setProperty(timmy .. "Miss.scale.x", 1.2)
        setProperty(timmy .. "Miss.scale.y", 1.2)

        doTweenX("timmyzoommiss X", timmy .. "Miss.scale", 1, ZoomHudDur, "linear")
        doTweenY("timmyzoommiss Y", timmy .. "Miss.scale", 1, ZoomHudDur, "linear")

        setProperty(timmy .. "Miss.color", getColorFromHex("5B0000"))
        doTweenColor("timmycolorohuh", timmy .. "Miss", "FFFFFF", ZoomHudDur, "linear")
    end
end

function onBeatHit()
    setProperty(timmy .. "clock.scale.x", 0.7)
    setProperty(timmy .. "clock.scale.y", 0.7)
    doTweenX("timmeClockScaleX", timmy .. "clock.scale", 0.6, 0.25, "linear")
    doTweenY("timmeClockScaleY", timmy .. "clock.scale", 0.6, 0.25, "linear")
    if curBeat % 6 == 0 then
        setProperty(timmy .. "clock.angle", getProperty(timmy .. "clock.angle") + 5)
    end
end

function round(x, n) -- https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then
        x = math.floor(x + 0.5)
    else
        x = math.ceil(x - 0.5)
    end
    return x / n
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)
    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)
end
