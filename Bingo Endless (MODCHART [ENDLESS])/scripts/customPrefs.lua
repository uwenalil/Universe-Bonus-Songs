opaqueHolds = true -- makes note trails fully visible
opaqueSplashes = true --[[same as the one above, except it makes the note splashes fully visible
WARNING: deactivate along with note splashes and viceversa!]]
hitSounds = false -- activates hitsounds for when a note is hitSounds
soundToPlay = 'hitSounds/note_click' -- self explanatory
function onCreate()
    if hitSounds then
	    precacheSound('hitSounds/note_click');
	end
end

function onUpdate(elapsed)
    if opaqueHolds then
        for i = 0, 8 do
	        multAlpha = getPropertyFromGroup('unspawnNotes', i, 'multAlpha');
		    isSustainNote = getPropertyFromGroup('unspawnNotes', i, 'isSustainNote');
	        if isSustainNote and multAlpha == 0.6 then
			    setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 1);
			end
		end
	end
	if opaqueSplashes then
        for i = 0, getProperty('grpNoteSplashes.length')-1 do
	        grpAlpha = getPropertyFromGroup('grpNoteSplashes', i, 'alpha');
	        if grpAlpha < 1 then
			    setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 1);
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote and hitSounds then
	    playSound(soundToPlay, 1);
	end
end