function onBeatHit()
    -- botply TEXT --
    setProperty('botplayTxt.scale.x', 1.3); setProperty('botplayTxt.scale.y', 1.3)
    doTweenX('MtextSizeX', 'botplayTxt.scale', 1, 0.1, 'linear'); doTweenY('MtextSizeY', 'botplayTxt.scale', 1, 0.1, 'linear')
end