function onUpdate(elapsed)
    if universeEngine then
        setTextString("UEdiffucultyLVL", "6")

        setProperty("UEsong.visible", false)
        setProperty("UEtimeTxt.visible", false)
        setProperty("UEmiss.visible", false)
        setProperty("UEscore.visible", false)
        setProperty("UErating.visible", false)

        setProperty("UE ratingTxt.visible", false)
        setProperty("UE comboTxt.visible", false)

        if (curStep > 0 and curStep < 23) then
            cancelTween("UE song name popup hi")
            cancelTween("UE info 1 hi")
            cancelTween("UE info 2 hi")
            cancelTween("UEdiffucultyLVL A")

            setProperty("UEdiffucultyLVL.alpha", 0)

            setProperty("upButton.visible", false)
            setProperty("downButton.visible", false)
            setProperty("leftButton.visible", false)
            setProperty("rightButton.visible", false)
        end
    end
end

local UEtheypopup = 160
local UEtheygone = 570
local UEtheypopuphi = 1
local UEtheypopuppos = 10
function onStepHit()
    if universeEngine then
        if curStep == 24 then
            doTweenX("UE song name popup hi", "UE song name popup", UEtheypopuppos, UEtheypopuphi, "expoOut")
            -- doTweenX("UE difficulty popup hi", "UE difficulty popup", UEtheypopuppos, UEtheypopuphi, "expoOut")
            doTweenX("UE info 1 hi", "UE info 1", UEtheypopuppos, UEtheypopuphi, "expoOut")
            doTweenX("UE info 2 hi", "UE info 2", UEtheypopuppos, UEtheypopuphi, "expoOut")
            runTimer("UE they go bye", 3, 1)
            runTimer("UE text remove bye", 10, 1)

            doTweenAlpha("UEdiffucultyLVL A", "UEdiffucultyLVL", 1, 1, "linear")
            runTimer("UEdiffucultyLVL AT", 3, 1)

            setProperty("upButton.visible", true)
            setProperty("downButton.visible", true)
            setProperty("leftButton.visible", true)
            setProperty("rightButton.visible", true)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'UE they go bye' then
        doTweenX("UE song name popup hi", "UE song name popup", -1000, UEtheypopuphi, "expoIn")
        -- doTweenX("UE difficulty popup hi", "UE difficulty popup", -1000, UEtheypopuphi, "expoIn")
        doTweenX("UE info 1 hi", "UE info 1", -1000, UEtheypopuphi, "expoIn")
        doTweenX("UE info 2 hi", "UE info 2", -1000, UEtheypopuphi, "expoIn")
    end
    if tag == 'UE text remove bye' then
        removeLuaText("UE song name popup")
        -- removeLuaText("UE difficulty popup")
        removeLuaText("UE info 1")
        removeLuaText("UE info 2")
    end
    if tag == 'UEdiffucultyLVL AT' then
        doTweenAlpha("UEdiffucultyLVL A", "UEdiffucultyLVL", 0, 3, "linear")
    end
end
