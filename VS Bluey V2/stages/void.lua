function onCreate()
	-- background shit
	makeLuaSprite('hate', 'hate', -600, -300);
	setScrollFactor('hate', 0.9, 0.9);

	addLuaSprite('hate', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end