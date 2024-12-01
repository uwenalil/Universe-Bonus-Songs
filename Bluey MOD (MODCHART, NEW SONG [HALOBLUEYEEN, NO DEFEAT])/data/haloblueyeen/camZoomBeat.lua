function onStepHit()
    if ((curStep >= 192 and curStep < 448) or (curStep >= 576 and curStep < 704) or (curStep >= 832 and curStep < 1088) or (curStep >= 1216 and curStep < 1335) or (curStep >= 1344 and curStep < 1472)) then
        if curStep % 4 == 0 then
            triggerEvent("Add Camera Zoom", 0.025, 0.03)
        end
    end
end