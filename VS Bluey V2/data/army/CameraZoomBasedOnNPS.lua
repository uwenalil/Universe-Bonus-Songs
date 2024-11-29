-- Config
-- Edit aspects about this script below:

local camZoomPlayer = 0.8
local camZoomOpponent = 0.7


local zoomBasedOnNPS = true -- If the zoom should be based on your NPS 
local NPSAdditionRate = 0.06 -- How much nps should be added
local NPSRemovalMiss = 0.2 -- How much nps should be removed upon miss
local NPSRemovalRate = 0.01 -- How much nps should be removed every update

-- Actual script

local zoom = 0
local nps = 0
local oppNPS = 0


function goodNoteHit()
	if(nps < 0.7) then nps = nps + NPSAdditionRate; end
end
function onMiss()
	onNoteMiss()
end
function onNoteMiss()
	if(nps > 0) then nps = nps - NPSRemovalMiss; end
	if(nps < 0) then nps = 0; end
end
function opponentNoteHit()
	oppNPS = oppNPS + NPSAdditionRate
end

function onUpdate(elapsed)
	if(zoomBasedOnNPS) then
		if(nps > 0) then nps = nps - NPSRemovalRate end
		if(oppNPS > 0) then oppNPS = oppNPS - NPSRemovalRate end
		if(nps < 0) then nps = 0; end
		if(oppNPS < 0) then oppNPS = 0; end
	end
    setProperty('defaultCamZoom',(mustHitSection and camZoomPlayer + (zoomBasedOnNPS and math.min(nps,0.4)) or camZoomOpponent + (zoomBasedOnNPS and math.min(oppNPS,0.4))))
end