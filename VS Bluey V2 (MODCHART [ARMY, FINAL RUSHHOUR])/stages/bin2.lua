function onCreate()
	-- background shit
	makeLuaSprite('bin2', 'bin2', -600, -300);
	setScrollFactor('bin2', 0.9, 0.9);

	addLuaSprite('bin2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end