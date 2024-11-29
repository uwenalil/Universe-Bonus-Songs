function onCreatePost()
    setProperty("boyfriend.y", getProperty("boyfriend.y") + 80)
    setProperty("boyfriend.x", getProperty("boyfriend.x") - 180)

    -- hide gf
    setProperty("gf.visible", false)
end