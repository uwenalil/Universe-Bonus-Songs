function onCreate()
	-- background shit
	makeLuaSprite('bin1', 'bin1', -600, -300);
	setScrollFactor('bin1', 0.9, 0.9);

	addLuaSprite('bin1', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end