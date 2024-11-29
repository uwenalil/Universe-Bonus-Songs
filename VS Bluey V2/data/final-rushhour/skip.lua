local reverseTime = false
didskip = false

function onCreatePost()
    makeLuaText('skip', 'Press Space to Skip Intro', 1270, 0, 200);
    addLuaText('skip');
    setTextSize('skip', 30)
    doTweenAlpha('skipfuera', 'skip', 0, 7, 'linear')
end

function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not getProperty('startingSong') and didskip ==
        false then
        didskip = true
        removeLuaText('skip');
        setPropertyFromClass('Conductor', 'songPosition', 8300) -- it is counted by milliseconds, 1000 = 1 second
        setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
        setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
    end
    if curStep > 79 then
        reverseTime = true
        didskip = true
    end
end

