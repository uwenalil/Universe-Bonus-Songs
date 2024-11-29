function noteMiss(id,direction)
    if direction == 0 then
        characterPlayAnim('boyfriend', 'singLEFT', true);
    elseif direction == 1 then
        characterPlayAnim('boyfriend', 'singDOWN', true);
    elseif direction == 2 then
        characterPlayAnim('boyfriend', 'singUP', true);
    elseif direction == 3 then
        characterPlayAnim('boyfriend', 'singRIGHT', true);
    end
    setProperty("boyfriend.color", getColorFromHex("0xAD5CAD"))
    runTimer("boyfriend normal color", 0.5,1)
end

function goodNoteHit()
    cancelTimer("boyfriend normal color")
    setProperty("boyfriend.color", getColorFromHex("0xFFFFFF"))
end

function onTimerCompleted(tag)
    if tag == "boyfriend normal color" then
        setProperty("boyfriend.color", getColorFromHex("0xFFFFFF"))
    end
end