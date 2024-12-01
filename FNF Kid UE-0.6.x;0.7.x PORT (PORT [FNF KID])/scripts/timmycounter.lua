local timmyC = "timmyCombo"
function onCreatePost()
    makeLuaText(timmyC, "sick!!!\n0", 500, (screenWidth / 2) - (500 / 2), 460)
    if downscroll then setProperty(timmyC..".y", 180) end
    setTextFont(timmyC, "funkin.ttf")
    setTextSize(timmyC, 41)
    setProperty(timmyC .. ".alpha", 0)
    addLuaText(timmyC)

    setProperty('showRating', false);
    setProperty('showComboNum', false);
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    local rawNoteRating = getPropertyFromGroup('notes', membersIndex, 'rating')
    local noteRating = rawNoteRating

    if rawNoteRating == "sick" then
        noteRating = "SICK!"
    elseif rawNoteRating == "good" then
        noteRating = "Good"
    elseif rawNoteRating == "bad" then
        noteRating = "Bad.."
    elseif rawNoteRating == "shit" then
        noteRating = "oh shoots..."
    end

    if not isSustainNote then
        setTextString(timmyC, noteRating .. "\n" .. getProperty("combo"))

        setProperty(timmyC .. ".scale.y", 1.3)
        setProperty(timmyC .. ".scale.x", 1.3)
        doTweenY("TIMMEH Y", timmyC .. ".scale", 1, 1, "expoOut")
        doTweenX("TIMMEH X", timmyC .. ".scale", 1, 1, "expoOut")

        setProperty(timmyC .. ".alpha", 1)
        doTweenAlpha("TIMMEH ALPHA", timmyC, 0, 1, "expoOut")
    end

    if noteData == 0 then
        setProperty(timmyC..".color", getColorFromHex("C14B99"))
    elseif noteData == 1 then
        setProperty(timmyC..".color", getColorFromHex("01FFFF"))
    elseif noteData == 2 then
        setProperty(timmyC..".color", getColorFromHex("12FA04"))
    elseif noteData == 3 then
        setProperty(timmyC..".color", getColorFromHex("FA3840"))
    end
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    setTextString(timmyC, "Miss\n0")
    setProperty(timmyC..".color", getColorFromHex("5B0000"))
    if not isSustainNote then
        setProperty(timmyC .. ".scale.y", 1.3)
        setProperty(timmyC .. ".scale.x", 1.3)
        doTweenY("TIMMEH Y", timmyC .. ".scale", 1, 0.25, "backout")
        doTweenX("TIMMEH X", timmyC .. ".scale", 1, 0.25, "backout")

        setProperty(timmyC .. ".alpha", 1)
        doTweenAlpha("TIMMEH ALPHA", timmyC, 0, 0.5, "backout")
    end
end