function onCreate()
	-- background shit
	makeLuaSprite('bin3', 'bin3', -600, -300);
	setScrollFactor('bin3', 0.9, 0.9);

	addLuaSprite('bin3', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end