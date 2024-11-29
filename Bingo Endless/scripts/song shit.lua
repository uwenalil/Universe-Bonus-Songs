local turnvalue = 20
IntroTextSize = 25    --Size of the text for the Now Playing thing.
IntroSubTextSize = 70 --size of the text for the Song Name.
IntroTagWidth = 15    --Width of the box's tag thingy.

--actual script
function onCreate()


    --now playing
    makeLuaSprite('chalktext wowie amazing', 'UI/ChalkboardText', -505, 0)
    setObjectCamera('chalktext wowie amazing', 'other')
setProperty('chalktext wowie amazing.antialiasing',false)
scaleObject('chalktext wowie amazing', 2, 2)
    addLuaSprite('chalktext wowie amazing', true)  

    --text for the song name
    makeLuaText('the song name text super', songName, 380, -450-IntroTagWidth, 130)
    setTextAlignment('the song name text super', 'center')
    setObjectCamera('the song name text super', 'other')
setProperty('the song name text super.antialiasing',false)
    setTextSize('the song name text super', IntroSubTextSize)
    setObjectOrder('the song name text super', 500)
    addLuaText('the song name text super')
end

function onSongStart()
    -- Inst and Vocals start playing, songPosition = 0
    doTweenX('MoveInOne', 'mega amazing chalk',  0, 1, 'CircOut')
    doTweenX('MoveInTwo', 'the box in the chalkboard why',  0, 1, 'CircOut')
    doTweenX('MoveInThree2', 'chalktext wowie amazing',  IntroTagWidth - 15, 1, 'CircOut')
    doTweenX('MoveInFour2', 'the song name text super',  35, 1, 'CircOut')
    
    runTimer('JukeBoxWait', 2, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    -- A loop from a timer you called has been completed, value "tag" is it's tag
    -- loops = how many loops it will have done when it ends completely
    -- loopsLeft = how many are remaining
    if tag == 'JukeBoxWait' then
        doTweenY('MoveOutOne', 'mega amazing chalk', 1280, 1.5, 'CircIn')
  doTweenY('MoveOutTwo', 'the box in the chalkboard why', 1280, 1.5, 'CircIn')
  doTweenY('MoveOutThree', 'chalktext wowie amazing', 1280 + (IntroTagWidth - 15), 1.5, 'CircIn')
        doTweenY('MoveOutFour', 'the song name text super',  1315, 1.5, 'CircIn')
    end
end