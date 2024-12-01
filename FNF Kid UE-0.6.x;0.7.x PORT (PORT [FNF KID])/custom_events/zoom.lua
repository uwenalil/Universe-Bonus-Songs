function onEvent(eventName, value1, value2, strumTime)
    if eventName == "zoom" then
        setProperty("defaultCamZoom", value1 + 0.1)
    end
end