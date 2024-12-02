local xPos = 1080 - 150
local textXpos = 10
local startTextXpos = -1500
local startXpos = 1080 + 500

local curSelect = 1
local winCounter = 0
local tieCounter = 0
local loseCounter = 0

local curSelect1 = 70
local curSelect2 = 70 + 230
local curSelect3 = 70 + 230 + 230

local aiPick = {"Rock", "Paper", "Scissors"}
local aiPickConfirm = "None"

local exitDuration = 2

function onCreatePost()
    -- music
    -- universse engine!!
    -- playMusic("freakyMenu-" .. getPropertyFromClass("ClientPrefs", "mmm"), 1, true)
    playMusic("freakyMenu", 1, true)

    -- hide hud
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)

    -- helps performance issue 👍
    setProperty('bf.visible', false)
    setProperty('dad.visible', false)
    setProperty('gf.visible', false)

    -- sprite
    makeLuaSprite('backGround', "darkMenu", 0, 0)
    setProperty('backGround.color', getColorFromHex("00FFFF"))
    screenCenter('backGround')
    setObjectOrder('backGround', 1)
    addLuaSprite('backGround', true)
    setProperty('backGround.alpha', 1)
    setObjectCamera('backGround', 'camHUD')

    makeLuaSprite('flash', nil, 0, 0)
    makeGraphic("flash", screenWidth, screenHeight, 'FFFFFF')
    addLuaSprite('flash', true)
    setProperty('flash.alpha', 0)
    setObjectCamera('flash', 'other')

    makeLuaSprite('rock', "rock", startXpos, -50)
    setObjectOrder('rock', 1)
    addLuaSprite('rock', true)
    setProperty('rock.alpha', 1)
    setObjectCamera('rock', 'camHUD')
    setObjectOrder("rock", getObjectOrder("backGround") + 1)

    makeLuaSprite('paper', "paper", startXpos, screenHeight / 4)
    setObjectOrder('paper', 1)
    addLuaSprite('paper', true)
    setProperty('paper.alpha', 1)
    setObjectCamera('paper', 'camHUD')
    setObjectOrder("paper", getObjectOrder("backGround") + 1)

    makeLuaSprite('scissors', "scissors", startXpos, screenHeight / 1.65)
    setObjectOrder('scissors', 1)
    addLuaSprite('scissors', true)
    setProperty('scissors.alpha', 1)
    setObjectCamera('scissors', 'camHUD')
    setObjectOrder("scissors", getObjectOrder("backGround") + 1)

    setProperty('rock.scale.x', 0.75)
    setProperty('rock.scale.y', 0.75)
    setProperty('paper.scale.x', 0.75)
    setProperty('paper.scale.y', 0.75)
    setProperty('scissors.scale.x', 0.75)
    setProperty('scissors.scale.y', 0.75)

    -- text
    makeLuaText("credice", "uwenalil - Everything, Zander - Idea", 0, startTextXpos, 0)
    setTextSize("credice", 41)
    setObjectCamera('credice', 'camHUD')
    setObjectOrder('credice', getObjectOrder("backGround") + 1)
    addLuaText('credice')

    makeLuaText("welcome", "welcome to uwen's rock paper scissors!", 0, startTextXpos, 50)
    setTextSize("welcome", 21)
    setObjectCamera('welcome', 'camHUD')
    setObjectOrder('welcome', getObjectOrder("backGround") + 1)
    addLuaText('welcome')

    makeLuaText("keybinds", "use UP or DOWN to select and enter to confirm!", 0, startTextXpos,
        getProperty("welcome.y") + 20)
    setTextSize("keybinds", 21)
    setObjectCamera('keybinds', 'camHUD')
    setObjectOrder('keybinds', getObjectOrder("backGround") + 1)
    addLuaText('keybinds')

    makeLuaText("aiPickAboveText", "Opponent Picked", 500, startTextXpos, screenHeight / 2 - 40)
    setTextSize("aiPickAboveText", 41)
    setObjectCamera('aiPickAboveText', 'camHUD')
    setObjectOrder('aiPickAboveText', getObjectOrder("backGround") + 1)
    setTextAlignment("aiPickAboveText", "center")
    addLuaText('aiPickAboveText')

    makeLuaText("aiPickText", "error", 500, startTextXpos, screenHeight / 2)
    setTextSize("aiPickText", 41)
    setObjectCamera('aiPickText', 'camHUD')
    setObjectOrder('aiPickText', getObjectOrder("backGround") + 1)
    setTextAlignment("aiPickText", "center")
    addLuaText('aiPickText')

    makeLuaText("comeagain", "Come again soon!", 500, 0, 0)
    screenCenter("comeagain")
    setTextSize("comeagain", 41)
    setObjectCamera('comeagain', 'camHUD')
    setObjectOrder('comeagain', getObjectOrder("backGround") + 1)
    setProperty('comeagain.alpha', 0)
    setTextAlignment("comeagain", "center")
    addLuaText('comeagain')

    -- the selection thing lolololol
    makeLuaText("leftSelection", "<", 0, startXpos, 70)
    setTextSize("leftSelection", 41)
    setObjectCamera('leftSelection', 'camHUD')
    setObjectOrder('leftSelection', getObjectOrder("backGround") + 1)
    addLuaText('leftSelection')

    makeLuaText("rightSelection", ">", 0, startXpos, 70)
    setTextSize("rightSelection", 41)
    setObjectCamera('rightSelection', 'camHUD')
    setObjectOrder('rightSelection', getObjectOrder("backGround") + 1)
    addLuaText('rightSelection')

    -- the win lose tie lol
    makeLuaText("WTL", "", 0, startTextXpos, 100)
    setTextSize("WTL", 41)
    setObjectCamera('WTL', 'camHUD')
    setTextAlignment('WTL', 'left')
    setObjectOrder('WTL', getObjectOrder("backGround") + 1)
    addLuaText('WTL')

    -- tweening
    doTweenX("hizander leftSelectionTweening", "leftSelection", xPos + 250, 2, "expoOut")
    doTweenX("hizander rightSelectionTweening", "rightSelection", xPos + 25, 2, "expoOut")

    doTweenX("hizander rockTweening", "rock", xPos, 2, "expoOut")
    doTweenX("hizander paperTweening", "paper", xPos, 3, "expoOut")
    doTweenX("hizander scissorsTweening", "scissors", xPos, 4, "expoOut")

    doTweenX("hizander crediceTweening", "credice", textXpos, 2, "expoOut")
    doTweenX("hizander welcomeTweening", "welcome", textXpos, 3, "expoOut")
    doTweenX("hizander keybindsTweening", "keybinds", textXpos, 4, "expoOut")
    doTweenX("hizander WTLTweening", "WTL", textXpos, 4, "expoOut")

    doTweenX("hizander aiPickAboveTextTweening", "aiPickAboveText", textXpos + 150, 3, "expoOut")
    doTweenX("hizander aiPickTextTweening", "aiPickText", textXpos + 150, 4, "expoOut")

    mobileButtonSprites()
end

function onStartCountdown()
    return Function_Stop
end

function onUpdate(elapsed)
    setTextString("aiPickText", aiPickConfirm)
    setTextString('WTL', "W: " .. winCounter .. "\nT: " .. tieCounter .. "\nL: " .. loseCounter)

    -- keybind
    if keyJustPressed('back') then
        exit()
    end
    if keyboardJustPressed("R") then
        restartSong()
        playSound('cancelMenu')
    end

    -- selection lol
    if keyJustPressed('up') then
        curSelect = curSelect - 1
        playSound('scrollMenu')
    end

    if keyJustPressed('down') then
        curSelect = curSelect + 1
        playSound('scrollMenu')
    end

    if keyJustPressed('accept') then
        confirm()
    end

    -- prevent going off counter
    if curSelect == 0 then
        curSelect = 3
    end
    if curSelect == 4 then
        curSelect = 1
    end

    -- moving arrow
    if curSelect == 1 then
        doTweenY("leftSelection Tweening Y", "leftSelection", curSelect1, 0.5, "expoOut")
        doTweenY("rightSelection Tweening Y", "rightSelection", curSelect1, 0.5, "expoOut")
    end

    if curSelect == 2 then
        doTweenY("leftSelection Tweening Y", "leftSelection", curSelect2, 0.5, "expoOut")
        doTweenY("rightSelection Tweening Y", "rightSelection", curSelect2, 0.5, "expoOut")
    end

    if curSelect == 3 then
        doTweenY("leftSelection Tweening Y", "leftSelection", curSelect3, 0.5, "expoOut")
        doTweenY("rightSelection Tweening Y", "rightSelection", curSelect3, 0.5, "expoOut")
    end

    mobileButtons()
end

function onDestroy()
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "comeAgainSoon" then
        exitSong()
        playSound('cancelMenu')
    end
end

function confirm()
    aiPickConfirm = aiPick[getRandomInt(1, #aiPick)]
    if curSelect == 1 and aiPickConfirm == "Rock" then
        flash("FFFF00")
        playSound('scrollMenu')
        tieCounter = tieCounter + 1
    elseif curSelect == 1 and aiPickConfirm == "Paper" then
        flash("FF0000")
        playSound('cancelMenu')
        loseCounter = loseCounter + 1
    elseif curSelect == 1 and aiPickConfirm == "Scissors" then
        flash("00FF00")
        playSound("confirmMenu")
        winCounter = winCounter + 1
    end

    if curSelect == 2 and aiPickConfirm == "Rock" then
        flash("00FF00")
        playSound("confirmMenu")
        winCounter = winCounter + 1
    elseif curSelect == 2 and aiPickConfirm == "Paper" then
        flash("FFFF00")
        playSound('scrollMenu')
        tieCounter = tieCounter + 1
    elseif curSelect == 2 and aiPickConfirm == "Scissors" then
        flash("FF0000")
        playSound('cancelMenu')
        loseCounter = loseCounter + 1
    end

    if curSelect == 3 and aiPickConfirm == "Rock" then
        flash("FF0000")
        playSound('cancelMenu')
        loseCounter = loseCounter + 1
    elseif curSelect == 3 and aiPickConfirm == "Paper" then
        flash("00FF00")
        playSound("confirmMenu")
        winCounter = winCounter + 1
    elseif curSelect == 3 and aiPickConfirm == "Scissors" then
        flash("FFFF00")
        playSound('scrollMenu')
        tieCounter = tieCounter + 1
    end
end

function exit()
    setProperty('comeagain.alpha', 1)
    runTimer("comeAgainSoon", 2, 0)
    musicFadeOut(2)

    doTweenX("hizander leftSelectionTweening", "leftSelection", startXpos, exitDuration, "expoIn")
    doTweenX("hizander rightSelectionTweening", "rightSelection", startXpos, exitDuration, "expoIn")

    doTweenX("hizander rockTweening", "rock", startXpos, exitDuration, "expoIn")
    doTweenX("hizander paperTweening", "paper", startXpos, exitDuration, "expoIn")
    doTweenX("hizander scissorsTweening", "scissors", startXpos, exitDuration, "expoIn")

    doTweenX("hizander crediceTweening", "credice", startTextXpos, exitDuration, "expoIn")
    doTweenX("hizander welcomeTweening", "welcome", startTextXpos, exitDuration, "expoIn")
    doTweenX("hizander keybindsTweening", "keybinds", startTextXpos, exitDuration, "expoIn")
    doTweenX("hizander WTLTweening", "WTL", startTextXpos, exitDuration, "expoIn")

    doTweenX("hizander aiPickAboveTextTweening", "aiPickAboveText", startTextXpos, exitDuration, "expoIn")
    doTweenX("hizander aiPickTextTweening", "aiPickText", startTextXpos, exitDuration, "expoIn")

    doTweenY("upGo", "upArrow", getProperty('upArrow.y') - 150, exitDuration, "expoIn")
    doTweenY("downGo", "downArrow", getProperty('downArrow.y') + 150, exitDuration, "expoIn")
    doTweenX("rightGo", "rightArrow", -150, exitDuration, "expoIn")
    doTweenX("confirmGo", "confirm", -150, exitDuration, "expoIn")

    doTweenX('comeagain X', 'comeagain.scale', 0, exitDuration, 'expoIn')
    doTweenY('comeagain Y', 'comeagain.scale', 0, exitDuration, 'expoIn')
    doTweenAngle('comeagain ANG', 'comeagain', 360, exitDuration, 'expoIn')
end

function flash(color)
    setProperty('flash.alpha', 0.5)
    setProperty('flash.color', getColorFromHex(color))
    doTweenAlpha('flashflash', 'flash', 0, 1, 'linear')
end

function mobileButtonSprites()
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)

    makeLuaSprite("upArrow", 'arrow', 0, 0)
    screenCenter('upArrow', 'x')
    addLuaSprite("upArrow")
    setObjectCamera("upArrow", 'other')
    setProperty("upArrow.alpha", 0.5)

    makeLuaSprite("downArrow", 'arrow', 0, screenHeight - 150)
    screenCenter('downArrow', 'x')
    addLuaSprite("downArrow")
    setObjectCamera("downArrow", 'other')
    setProperty("downArrow.alpha", 0.5)
    setProperty('downArrow.angle', 180)

    makeLuaSprite("rightArrow", 'arrow', 0, screenHeight - 150)
    addLuaSprite("rightArrow")
    setObjectCamera("rightArrow", 'other')
    setProperty('rightArrow.angle', -90)
    setProperty("rightArrow.alpha", 0.5)

    makeLuaSprite("confirm", 'circle', 0, 0)
    screenCenter('confirm', 'y')
    addLuaSprite("confirm")
    setObjectCamera("confirm", 'other')
    setProperty("confirm.alpha", 0.5)
end

function mobileButtons()
    local mouseX, mouseY = getMouseX('camHUD'), getMouseY('camHUD')

    local upArrowYsprite = getProperty("upArrow.y")
    local upArrowXsprite = getProperty("upArrow.x")
    local upArrowHeightSprite = getProperty("upArrow.height")
    local upArrowWidthSprite = getProperty("upArrow.width")

    local downArrowYsprite = getProperty("downArrow.y")
    local downArrowXsprite = getProperty("downArrow.x")
    local downArrowHeightSprite = getProperty("downArrow.height")
    local downArrowWidthSprite = getProperty("downArrow.width")

    local rightArrowYsprite = getProperty("rightArrow.y")
    local rightArrowXsprite = getProperty("rightArrow.x")
    local rightArrowHeightSprite = getProperty("rightArrow.height")
    local rightArrowWidthSprite = getProperty("rightArrow.width")

    local confirmYsprite = getProperty("confirm.y")
    local confirmXsprite = getProperty("confirm.x")
    local confirmHeightSprite = getProperty("confirm.height")
    local confirmWidthSprite = getProperty("confirm.width")

    if mouseClicked("left") then
        if mouseX >= upArrowXsprite and mouseX <= upArrowXsprite + upArrowWidthSprite and mouseY >= upArrowYsprite and
            mouseY <= upArrowYsprite + upArrowHeightSprite then
            curSelect = curSelect - 1
            playSound('scrollMenu')
        end

        if mouseX >= downArrowXsprite and mouseX <= downArrowXsprite + downArrowWidthSprite and mouseY >=
            downArrowYsprite and mouseY <= downArrowYsprite + downArrowHeightSprite then
            curSelect = curSelect + 1
            playSound('scrollMenu')
        end

        if mouseX >= rightArrowXsprite and mouseX <= rightArrowXsprite + rightArrowWidthSprite and mouseY >=
            rightArrowYsprite and mouseY <= rightArrowYsprite + rightArrowHeightSprite then
            exit()
        end

        if mouseX >= confirmXsprite and mouseX <= confirmXsprite + confirmWidthSprite and mouseY >= confirmYsprite and
            mouseY <= confirmYsprite + confirmHeightSprite then
            confirm()
        end
    end
end
