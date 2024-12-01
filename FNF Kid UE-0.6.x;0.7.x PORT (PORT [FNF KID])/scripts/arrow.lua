function onCreatePost()
    setPropertyFromGroup("opponentStrums", 0, "alpha", 1)
    setPropertyFromGroup("opponentStrums", 1, "alpha", 1)
    setPropertyFromGroup("opponentStrums", 2, "alpha", 1)
    setPropertyFromGroup("opponentStrums", 3, "alpha", 1)
    setPropertyFromGroup("playerStrums", 0, "alpha", 1)
    setPropertyFromGroup("playerStrums", 1, "alpha", 1)
    setPropertyFromGroup("playerStrums", 2, "alpha", 1)
    setPropertyFromGroup("playerStrums", 3, "alpha", 1)

    if middlescroll then
        setPropertyFromGroup("opponentStrums", 0, "alpha", 0.5)
        setPropertyFromGroup("opponentStrums", 1, "alpha", 0.5)
        setPropertyFromGroup("opponentStrums", 2, "alpha", 0.5)
        setPropertyFromGroup("opponentStrums", 3, "alpha", 0.5)
    end

    local StartArrowPOS = 50 - 200
    if downscroll then StartArrowPOS = 550 + 200 end
    setPropertyFromGroup("opponentStrums", 0, "y", StartArrowPOS)
    setPropertyFromGroup("opponentStrums", 1, "y", StartArrowPOS)
    setPropertyFromGroup("opponentStrums", 2, "y", StartArrowPOS)
    setPropertyFromGroup("opponentStrums", 3, "y", StartArrowPOS)
    setPropertyFromGroup("playerStrums", 0, "y", StartArrowPOS)
    setPropertyFromGroup("playerStrums", 1, "y", StartArrowPOS)
    setPropertyFromGroup("playerStrums", 2, "y", StartArrowPOS)
    setPropertyFromGroup("playerStrums", 3, "y", StartArrowPOS)
end