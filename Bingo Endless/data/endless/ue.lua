function onCreatePost()
    makeLuaText("noghosttap", "GHOST TAPPING DISABLED FOR THIS PART!!!", 500, 0.0, 0.0)
    screenCenter("noghosttap")
    setProperty("noghosttap.y", 180)
    setTextSize("noghosttap", 31)
    setProperty("noghosttap.alpha", 0)
    setTextFont("noghosttap", "bluey.ttf")
    addLuaText("noghosttap")
    -- text

    --setProperty("combo", 69420)
end

function onStepHit()
    if curStep == 888 then
        doTweenAlpha("noghosttap A", "noghosttap", 1, 1, "linear")
    end

    if curStep == 904 then
        doTweenAlpha("noghosttap A", "noghosttap", 0, 1, "linear")
    end

    if curStep == 1158 then
        setTextString("noghosttap", "GHOST TAPPING NOW ENABLED")
        doTweenAlpha("noghosttap A", "noghosttap", 1, 1, "linear")
    end

    if curStep == 1176 then
        doTweenAlpha("noghosttap A", "noghosttap", 0, 1, "linear")
    end
end

misssonds = {"missnote1", "missnote2", "missnote3"}
function onGhostTap(key)
    if ((curStep >= 904 and curStep < 1158)) then
        local nearKey = false
        for i = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', i, 'mustPress') and not getPropertyFromGroup('notes', i, 'ignoreNote') then
                nearKey = true
                break
            end
        end
        if nearKey then
            addHealth(-0.05 * healthLossMult)
            addMisses(1)
            playSound(misssonds[getRandomInt(1, #misssonds)])
            setProperty("combo", 0)

            if UEHud then
                updateInfoHUDMiss()
                updateComboMiss()
            end
        end
    end
end

function updateInfoHUDMiss()
    cancelTimer("UEH Disspear")
    cancelTimer("UEHM Disspear")

    cancelTween("UEmiss m")
    cancelTween("UEscore h")
    cancelTween("UErating h")

    setProperty("UEmiss.alpha", 1)
    setProperty("UEscore.alpha", 1)
    setProperty("UErating.alpha", 1)

    runTimer("UEH Disspear", 1, 1)
    runTimer("UEHM Disspear", 1, 1)

    cancelTween("UEmiss red")
    cancelTween("UEscore red")
    cancelTween("UErating red")

    setTextColor('UEscore', 'FF2B2B')
    setTextColor('UEmiss', 'FF2B2B')
    setTextColor('UErating', 'FF2B2B')

    doTweenColor('UEmiss red', 'UEmiss', 'FFFFFF', '1', 'linear')
    doTweenColor('UEscore red', 'UEscore', 'FFFFFF', '1', 'linear')
    doTweenColor('UErating red', 'UErating', 'FFFFFF', '1', 'linear')

    setTextString('UEmiss', 'Screw-Ups: ' .. misses)
end

local UEmisses = 0
aagth = 20
whataver = 2
UEccY = 520
function updateComboMiss()
    UEmisses = UEmisses + 1

    cancelTimer("UE comboRatingTXT D")
    cancelTween("UE ratingTxt A")
    cancelTween("UE comboTxt A")
    setProperty('UE ratingTxt.alpha', 1)
    setProperty('UE comboTxt.alpha', 1)

    setTextString("UE ratingTxt", "Miss...")
    setTextColor("UE ratingTxt", 'FF2B2B')
    setTextString("UE comboTxt", "-" .. UEmisses)
    setTextColor("UE comboTxt", 'FF2B2B')
    runTimer("UE comboRatingTXT A", 1, 1)

    setProperty("UE ratingTxt.y", UEccY + aagth)
    setProperty("UE comboTxt.y", UEccY + 40 + aagth)
    doTweenY("UE ratingTxt H", "UE ratingTxt", UEccY, whataver, "expoOut")
    doTweenY("UE comboTxt H", "UE comboTxt", UEccY + 40, whataver, "expoOut")
end

function goodNoteHit()
    UEmisses = 0
end
