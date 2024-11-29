function onCreate() 
	precacheImage('three')
	precacheImage('two')
	precacheImage('one')
	precacheImage('start!')
	precacheImage('blueybg')
	makeLuaSprite('three', 'trois', 0, 0)
	screenCenter('three', 'xy')
	setObjectCamera('three', 'other')
	makeLuaSprite('two', 'deux', 0, 0)
	screenCenter('two', 'xy')
	setObjectCamera('two', 'other')
	makeLuaSprite('one', 'une', 0, 0)
	screenCenter('one', 'xy')
	setObjectCamera('one', 'other')
	makeLuaSprite('go', 'start!', 0, 0)
	screenCenter('go', 'xy')
	setObjectCamera('go', 'other')
	makeLuaSprite('blueybg', 'blueybg', 0, 0)
	setObjectCamera('blueybg', 'other')
	addLuaSprite('blueybg')
	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
	setProperty('countdownGo.visible', false)
end
function onCountdownTick(counter)
	if counter == 0 then
		addLuaSprite('three')
	elseif counter == 1 then
		removeLuaSprite('three', false)
		addLuaSprite('two')
		setProperty('countdownReady.visible', false)		
	elseif counter == 2 then
		removeLuaSprite('two', false)
		addLuaSprite('one')
		setProperty('countdownSet.visible', false)
	elseif counter == 3 then
		removeLuaSprite('one', false)
		addLuaSprite('go')
		setProperty('go.angle', 360);
        		doTweenAngle('bop', 'go', 0, 0.1,'liner');
		runTimer('woah', 0.8);
		setProperty('countdownGo.visible', false)
	elseif counter == 4 then
		removeLuaSprite('go')
		removeLuaSprite('blueybg')
		cameraFlash('game','FFFFFF',1)
	end
end