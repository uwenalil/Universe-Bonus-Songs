function onCreate()
	-- background shit
	makeLuaSprite('endless', 'endless', -600, -300);
	setScrollFactor('endless', 0.9, 0.9);

	addLuaSprite('endless', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end