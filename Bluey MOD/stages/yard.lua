function onCreate()
    -- background shit
    makeLuaSprite('yard', 'yard', -720, -320);
    setScrollFactor('yard', 0.9, 0.9);
    scaleObject('yard', 1, 1);

    addLuaSprite('yard', false);
    addLuaSprite('speakerbox', false);

    if songName == 'Blueytastic' or songName == 'Heeler' then
        addLuaSprite('bingodancer', false)
    end
    if songName == 'Bingobop' then
        addLuaSprite('blueydancer', false)
    end

    close(true); -- For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
