local StartingHudX = -100
local TweeningHudX = 30
local TweeningHudDur = 1
local timmy = "timmyHud"
local ammarwalek = false
local noobwalek = false

function onCreatePost()
    -- preload
    precacheImage("the people/ammar")
    precacheImage("the people/bgHATER")
    precacheImage("the people/mrhat")
    precacheImage("the people/noob")
    precacheImage("the people/thecreator")

    -- the people
    makeAnimatedLuaSprite("idoXD", "the people/thecreator", 300, 1200)
    addAnimationByPrefix("idoXD", "beat", "idoxd 1", 14, false)
    scaleObject("idoXD", 1.5, 1.5)
    addLuaSprite("idoXD", true)

    makeAnimatedLuaSprite("bluey", "the people/bluey", 900, 1200)
    addAnimationByPrefix("bluey", "beat", "bluey 1", 14, false)
    scaleObject("bluey", 1.5, 1.5)
    addLuaSprite("bluey", true)

    makeAnimatedLuaSprite("mrhat", "the people/mrhat", 1300, 1200)
    addAnimationByPrefix("mrhat", "beat", "hat guy istanza 1", 14, false)
    scaleObject("mrhat", 1.5, 1.5)
    addLuaSprite("mrhat", true)

    makeAnimatedLuaSprite("bgHATER", "the people/bgHATER", -200, 2000)
    addAnimationByPrefix("bgHATER", "beat", "annoyer istanza 1", 14, false)
    scaleObject("bgHATER", 1.5, 1.5)
    addLuaSprite("bgHATER", true)

    makeAnimatedLuaSprite("ammaw", "the people/ammar", -700, 0)
    addAnimationByPrefix("ammaw", "walk", "ammar 1", 5, true)
    addAnimationByPrefix("ammaw", "idle", "ammar idle 1", 14, false)
    scaleObject("ammaw", 1.5, 1.5)
    addLuaSprite("ammaw", true)
    playAnim("ammaw", "walk")

    makeAnimatedLuaSprite("noob", "the people/noob", -700, 0)
    addAnimationByPrefix("noob", "walk", "roblox walk 1", 5, true)
    addAnimationByPrefix("noob", "idle", "roblox 1", 14, false)
    scaleObject("noob", 1.5, 1.5)
    addLuaSprite("noob", true)
    setObjectOrder("noob", getObjectOrder("bgHATER") - 1)
    playAnim("noob", "walk")

    -- aaa
    makeLuaSprite("blackFade", nil, 0, 0)
    makeGraphic("blackFade", 2000, 2000, "000000")
    setProperty("blackFade.alpha", 1)
    setObjectCamera("blackFade", "camHUD")
    addLuaSprite("blackFade", true)

    setProperty("healthBar.scale.x", 0)
    setProperty("healthBarBG.scale.x", 0)
    setProperty("defaultCamZoom", 1.5)

    setProperty("boyfriend.y", getProperty("boyfriend.y") + 30)

    setProperty("iconP1.y", getProperty("iconP1.y") + 200)
    setProperty("iconP2.y", getProperty("iconP2.y") + 200)
    if downscroll then
        setProperty("iconP1.y", getProperty("iconP1.y") - 200)
        setProperty("iconP2.y", getProperty("iconP2.y") - 200)
    end
end

function onCreate()
    setProperty("skipCountdown", true)
end

function onStepHit()
    if curStep == 24 then
        doTweenAlpha("blackFade", "blackFade", 0, 1, "linear")

        runTimer("Left Ease Arrow", 0.5, 0)
        runTimer("Down Ease Arrow", 0.6, 0)
        runTimer("Up Ease Arrow", 0.7, 0)
        runTimer("Right Ease Arrow", 0.8, 0)
    end

    if curStep == 30 then
        runTimer("smoothEnterHP", 1)

        runTimer("smoothEnterSicks", 0.25)
        runTimer("smoothEnterGoods", 0.3)
        runTimer("smoothEnterBads", 0.35)
        runTimer("smoothEnterOhUhs", 0.4)
        runTimer("smoothEnterMiss", 0.5)
        runTimer("smoothEnterScoreRating", 0.55)
    end

    if curStep == 32 then
        setProperty("defaultCamZoom", 0.8)

        doTweenY("iconP2 SmoothEnter", "iconP2", 565.8, TweeningHudDur, "backOut")
        doTweenY("iconP1 SmoothEnter", "iconP1", 565.8, TweeningHudDur, "backOut")
        if downscroll then
            doTweenY("iconP2 SmoothEnter", "iconP2", 4.2, TweeningHudDur, "backOut")
            doTweenY("iconP1 SmoothEnter", "iconP1", 4.2, TweeningHudDur, "backOut")
        end
    end

    if ((curStep > 160 - 1 and curStep < 544) or (curStep > 800 - 1 and curStep < 1056)) then
        if not downscroll then
            if curStep % 4 == 0 then
                doTweenY('iconP1 bounce', 'iconP1', 565.8 - 12, stepCrochet * 0.002, 'circOut')
                doTweenY('iconP2 bounce', 'iconP2', 565.8 - 12, stepCrochet * 0.002, 'circOut')
            end
            if curStep % 4 == 2 then
                doTweenY('iconP1 bounce 2', 'iconP1', 565.8, stepCrochet * 0.002, 'sineIn')
                doTweenY('iconP2 bounce 2', 'iconP2', 565.8, stepCrochet * 0.002, 'sineIn')
            end
        end
        if downscroll then
            if curStep % 4 == 0 then
                doTweenY('iconP1 bounce', 'iconP1', 4.2 - 12, stepCrochet * 0.002, 'circOut')
                doTweenY('iconP2 bounce', 'iconP2', 4.2 - 12, stepCrochet * 0.002, 'circOut')
            end
            if curStep % 4 == 2 then
                doTweenY('iconP1 bounce 2', 'iconP1', 4.2, stepCrochet * 0.002, 'sineIn')
                doTweenY('iconP2 bounce 2', 'iconP2', 4.2, stepCrochet * 0.002, 'sineIn')
            end
        end
    end
end

function onBeatHit()
    -- the people appear
    playAnim("idoXD", "beat")
    if ammarwalek then
        playAnim("ammaw", "idle")
    end
    if noobwalek then
        playAnim("noob", "idle")
    end
    playAnim("mrhat", "beat")
    playAnim("bgHATER", "beat")
    playAnim("bluey", "beat")

    local appearPeople = 590
    if curBeat == 40 then
        doTweenY("idoXD Appear", "idoXD", appearPeople, 1, "circOut")
    end
    if curBeat == 42 then
        doTweenX("ammar Appear", "ammaw", 180, 9, "linear")
    end
    if curBeat == 72 then
        doTweenY("bluey Appear", "bluey", appearPeople, 1, "circOut")
    end
    if curBeat == 168 then
        doTweenY("mrhat Appear", "mrhat", appearPeople, 1, "circOut")
    end
    if curBeat == 200 then
        doTweenY("bgHATER Appear", "bgHATER", appearPeople - 400, 1, "circOut")
    end
    if curBeat == 220 then
        doTweenX("noob Appear", "noob", -50, 9, "linear")
    end
end

function onTweenCompleted(tag)
    if tag == "ammar Appear" then
        if not ammarwalek then
            playAnim("ammaw", "idle")
            ammarwalek = true
        end
    end
    if tag == "noob Appear" then
        if not noobwalek then
            playAnim("noob", "idle")
            setProperty("noob.y", getProperty("noob.y") + 30)
            noobwalek = true
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "smoothEnterHP" then
        doTweenX("smoothEnterHP", "healthBar.scale", 1, 2, "expoOut")
        doTweenX("smoothEnterHPBG", "healthBarBG.scale", 1, 2, "expoOut")
    end
    if tag == "smoothEnterSicks" then
        doTweenX("smoothEnterSicks", timmy .. "Sick", TweeningHudX, TweeningHudDur, "backOut")
    end
    if tag == "smoothEnterGoods" then
        doTweenX("smoothEnterGoods", timmy .. "Good", TweeningHudX, TweeningHudDur, "backOut")
    end
    if tag == "smoothEnterBads" then
        doTweenX("smoothEnterBads", timmy .. "Bad", TweeningHudX, TweeningHudDur, "backOut")
    end
    if tag == "smoothEnterOhUhs" then
        doTweenX("smoothEnterOhUhs", timmy .. "OhUh", TweeningHudX, TweeningHudDur, "backOut")
    end
    if tag == "smoothEnterMiss" then
        doTweenX("smoothEnterMiss", timmy .. "Miss", TweeningHudX, TweeningHudDur, "backOut")
    end
    if tag == "smoothEnterScoreRating" then
        doTweenY("smoothEnterScoreRating", timmy .. "ScoreAndRating", 680, TweeningHudDur, "backOut")
        if downscroll then
            doTweenY("smoothEnterScoreRating", timmy .. "ScoreAndRating", 120, TweeningHudDur, "backOut")
        end
    end

    local ArrowPOSAppear = 50
    if downscroll then
        ArrowPOSAppear = 570
    end
    local ArrowDuration = 1
    local ArrowEase = "backOut"
    if tag == "Left Ease Arrow" then
        noteTweenY("opponent Left Appear", 0, ArrowPOSAppear, ArrowDuration, ArrowEase)
        noteTweenY("player Left Appear", 4, ArrowPOSAppear, ArrowDuration, ArrowEase)
    end
    if tag == "Down Ease Arrow" then
        noteTweenY("opponent Down Appear", 1, ArrowPOSAppear, ArrowDuration, ArrowEase)
        noteTweenY("player Down Appear", 5, ArrowPOSAppear, ArrowDuration, ArrowEase)
    end
    if tag == "Up Ease Arrow" then
        noteTweenY("opponent Up Appear", 2, ArrowPOSAppear, ArrowDuration, ArrowEase)
        noteTweenY("player Up Appear", 6, ArrowPOSAppear, ArrowDuration, ArrowEase)
    end
    if tag == "Right Ease Arrow" then
        noteTweenY("opponent Right Appear", 3, ArrowPOSAppear, ArrowDuration, ArrowEase)
        noteTweenY("player Right Appear", 7, ArrowPOSAppear, ArrowDuration, ArrowEase)
    end
end
