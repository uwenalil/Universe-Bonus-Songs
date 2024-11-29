local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
function onCreate()
    math.randomseed(os.clock() * 1000);
    
    --doTweenAlpha("gone","camHUD",0,0.01)
end
function onUpdate(elapsed)
        if mustHitSection == true then
            setProperty('defaultCamZoom',0.95)
        else
           
            setProperty('defaultCamZoom',0.85)
        end
end