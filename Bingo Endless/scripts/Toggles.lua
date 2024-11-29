function simpleishText(tag, text, textWidth, xPos, yPos, textSize, alignment)
	makeLuaText(tag, text, textWidth, xPos, yPos)
	setTextSize(tag, textSize)
	setTextColor(tag, 'FFFFFF')
	setTextBorder(tag, 2, '000000')
	setTextAlignment(tag, alignment)
	setObjectCamera(tag, 'HUD')
	addLuaText(tag)
end

loop = false
hud = true
lock = false

function KeyPress(key)
    return getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..key)
end

function onCreatePost()
    simpleishText('PracticeModeTracking', 'Practice Mode : ', screenWidth, 0, 200, 30, 'left')
    simpleishText('BotplayTracking', 'Botplay : ', screenWidth, 0, 240, 30, 'left')
    simpleishText('LoopTracking', 'Loop : ', screenWidth, 0, 280, 30, 'left')
    simpleishText('HealthTracking', 'Health : ', screenWidth, 0, 320, 30, 'left')

    setProperty('PracticeModeTracking.alpha', 0)
    setProperty('BotplayTracking.alpha', 0)
    setProperty('LoopTracking.alpha', 0)
    setProperty('HealthTracking.alpha', 0)
end

function onUpdate()
    -- practice mode
    if KeyPress('ONE') and getProperty('practiceMode') == false then
        setProperty('practiceMode', true)
        setTextString('PracticeModeTracking', 'Practice Mode: Enabled')
        setProperty('PracticeModeTracking.alpha', 1)
        runTimer('PracticeTimer', 1, 1)
        cancelTween('PracticeAlphaTween')
    elseif KeyPress('ONE') and getProperty('practiceMode') == true then
        setProperty('practiceMode', false)
        setTextString('PracticeModeTracking', 'Practice Mode: Disabled')
        setProperty('PracticeModeTracking.alpha', 1)
        runTimer('PracticeTimer', 1, 1)
        cancelTween('PracticeAlphaTween')
    end

    -- botplay
    if KeyPress('TWO') and botPlay == false then
        setProperty('cpuControlled', true)
        setTextString('BotplayTracking', 'Botplay: Enabled')
        setProperty('BotplayTracking.alpha', 1)
        runTimer('BotplayTimer', 1, 1)
        cancelTween('BotplayAlphaTween')
    elseif KeyPress('TWO') and botPlay == true then
        setProperty('cpuControlled', false)
        setTextString('BotplayTracking', 'Botplay: Disabled')
        setProperty('BotplayTracking.alpha', 1)
        runTimer('BotplayTimer', 1, 1)
        cancelTween('BotplayAlphaTween')
    end

    -- loop
    if KeyPress('THREE') and loop == false then
        loop = true
        setTextString('LoopTracking', 'Loop: Active')
        setProperty('LoopTracking.alpha', 1)
        runTimer('LoopTimer', 1, 1)
        cancelTween('LoopAlphaTween')
    elseif KeyPress('THREE') and loop == true then
        loop = false
        setTextString('LoopTracking', 'Loop: Not Active')
        setProperty('LoopTracking.alpha', 1)
        runTimer('LoopTimer', 1, 1)
        cancelTween('LoopAlphaTween')
    end

    -- hide all the shit
    if KeyPress('FOUR') and hud == true then
       hud = false
    elseif KeyPress('FOUR') and hud == false then
        hud = true
    end
    if hud == true then
        setProperty('camHUD.visible', true)
    elseif hud == false then
        setProperty('camHUD.visible', false)
    end

    -- lock health bruh
    if KeyPress('FIVE') and lock == true then
        lock = false
        setTextString('HealthTracking', 'Health: Unlocked')
        setProperty('HealthTracking.alpha', 1)
        runTimer('HealthTimer', 1, 1)
        cancelTween('HealthAlphaTween')
    elseif KeyPress('FIVE') and lock == false then
        lock = true
        setTextString('HealthTracking', 'Health: Locked')
        setProperty('HealthTracking.alpha', 1)
        runTimer('HealthTimer', 1, 1)
        cancelTween('HealthAlphaTween')
    end
    healt = getProperty('health')
    if lock == true then
        function noteMiss(membersIndex, noteData, noteType, isSustainNote)
            setProperty('health', healt-0)
        end
        function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
            setProperty('health', healt+0)
        end
    elseif lock == false then
        function noteMiss(membersIndex, noteData, noteType, isSustainNote)
            setProperty('health', healt-0.0475)
        end
        function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
            setProperty('health', healt+0.023)
        end
    end

    -- haha funi
    if KeyPress('ZERO') then
        endSong();
    end
end  

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'PracticeTimer' then
        doTweenAlpha('PracticeAlphaTween', 'PracticeModeTracking', 0, 2)
    end
    if tag == 'BotplayTimer' then
        doTweenAlpha('BotplayAlphaTween', 'BotplayTracking', 0, 2)
    end
    if tag == 'LoopTimer' then
        doTweenAlpha('LoopAlphaTween', 'LoopTracking', 0, 2)
    end
    if tag == 'HealthTimer' then
        doTweenAlpha('HealthAlphaTween', 'HealthTracking', 0, 2)
    end
end

function onEndSong()
    if loop then
        restartSong();
    elseif not loop then
        return Function_Continue
    end
    return Function_Stop
end