function onCreate()

keys = {'G', 'A', 'Y', 'S', 'E', 'X'}
curKey = 1
function onUpdatePost()

if getPropertyFromClass("flixel.FlxG","keys.justPressed."..keys[curKey]) then
    curKey = curKey + 1
end

if curKey == #keys+1 then
   loadSong('bandithasgaysexwiththecashier')
end
end
end
