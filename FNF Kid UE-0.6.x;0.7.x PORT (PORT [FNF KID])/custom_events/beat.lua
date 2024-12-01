function onCreatePost()
    precacheImage("light")
    makeLuaSprite("light", "light", 0, 0)
    screenCenter("light")
    setProperty("light.y", 200)
    setObjectCamera("light", "camHUD")
    setProperty("light.alpha", 0)
    addLuaSprite("light", true)
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == "beat" then
        -- debugPrint("yes")
        triggerEvent("Add Camera Zoom")
        light()
        if value1 == "1" then
            triggerEvent("Add Camera Zoom", 0.025, 0.05)
            light()
        end
    end
end

function light()
    setProperty("light.alpha", 1)
    doTweenAlpha("lightlightgoaway", "light", 0, 1, "linear")
end