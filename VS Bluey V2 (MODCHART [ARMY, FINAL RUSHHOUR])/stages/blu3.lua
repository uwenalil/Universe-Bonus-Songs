function onCreate()
	-- background shit
	makeLuaSprite('blu3', 'blu3', -600, -300);
	setScrollFactor('blu3', 0.9, 0.9);

	addLuaSprite('blu3', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end