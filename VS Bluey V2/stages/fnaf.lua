function onCreate()
	-- background shit
	makeLuaSprite('fnaf', 'fnaf', -600, -300);
	setScrollFactor('fnaf', 0.9, 0.9);

	addLuaSprite('fnaf', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end