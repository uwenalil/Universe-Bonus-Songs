function onCreate()
	makeLuaSprite('flash', 'flash', 0, 0);
	setLuaSpriteScrollFactor('flash', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('flash.scale.x', 1 / defaultCamZoom);
	setProperty('flash.scale.y', 1 / defaultCamZoom);
	setProperty('flash.alpha', 0.0001);
	addLuaSprite('flash', true);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "Flash" then
		setProperty('flash.alpha', 1);
		doTweenAlpha('tweenCutOffAlpha', 'flash', 0, 1.5, 'linear');
	end
end