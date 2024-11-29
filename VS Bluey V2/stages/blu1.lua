function onCreate()
	-- background shit
	makeLuaSprite('blu1', 'blu1', -600, -300);
	setScrollFactor('blu1', 0.9, 0.9);

	addLuaSprite('blu1', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end