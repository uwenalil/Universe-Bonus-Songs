function onCreate()

keys = {'P', 'I', 'G', 'E', 'O', 'N'}
curKey = 1
function onUpdatePost()

if getPropertyFromClass("flixel.FlxG","keys.justPressed."..keys[curKey]) then
    curKey = curKey + 1
end

if curKey == #keys+1 then
   loadSong('road-to-riches')
end
end
end
