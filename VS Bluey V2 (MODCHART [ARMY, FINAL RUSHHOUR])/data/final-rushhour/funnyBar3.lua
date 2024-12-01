function onCreate()
	makeLuaText('counter',math.floor(getProperty('health') * 500 / 10) .. '%',0,950,645)
	setProperty('timeTxt.y', 645)
	setProperty('timeTxt.x', 150)
	setTextSize('counter', 25)
	setTextSize('timeTxt', 25)
	addLuaText('counter')
end

function onUpdate()
	setTextString('counter',math.floor(getProperty('health') * 500 / 10) .. '%')
end