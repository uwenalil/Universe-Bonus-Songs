function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg', -600, -300);
	
	makeLuaSprite('lul', 'seperation', -600, -300);

	addLuaSprite('bg', false);
	addLuaSprite('lul', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end