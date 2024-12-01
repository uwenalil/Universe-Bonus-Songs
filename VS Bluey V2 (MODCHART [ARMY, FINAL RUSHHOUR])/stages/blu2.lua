function onCreate()
	-- background shit
	makeLuaSprite('blu2', 'blu2', -600, -300);
	setScrollFactor('blu2', 0.9, 0.9);

	addLuaSprite('blu2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end