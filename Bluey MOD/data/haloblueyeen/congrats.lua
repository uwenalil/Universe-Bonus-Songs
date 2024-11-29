-- ALL MADE IN NOTEPAD LMAOOO
congrats1 = 0
function onCreatePost()
makeLuaSprite('congratsimage', nil, 0, 0)
makeGraphic('congratsimage', screenWidth, screenHeight, 'FFFFFF')
addLuaSprite('congratsimage', true)
setObjectCamera('congratsimage', 'other')
setProperty("congratsimage.alpha", 0)
end

function noteMiss()
if ((curStep >= 576 and curStep < 704) or (curStep >= 1216 and curStep < 1472))then
congrats1 = congrats1 + 1
end
end

function onStepHit()
if ((curStep == 704) or (curStep == 1472)) then
if congrats1 < 1 then
playSound("confirmMenu", 0.5)
setProperty("congratsimage.color", getColorFromHex("0x00FF00"))
end
if congrats1 > 0 then
playSound("missnote1", 0.5)
setProperty("congratsimage.color", getColorFromHex("0xFF0000"))
end
setProperty("congratsimage.alpha", 0.5)
doTweenAlpha("congratsimage A", "congratsimage", 0, 1, "linear")
congrats1 = 0
end
end