function onCreate()
	makeLuaSprite('bg', 'bb', -600, -300);
	setScrollFactor('bg', 0.9, 0.9);
	addLuaSprite('bg', false)

	if not lowQuality then
		makeAnimatedLuaSprite('bg boppers','bg boppers',-554,-255);
		addAnimationByPrefix('bg boppers','dance','BG Boppers Idle',16,false);
		setScrollFactor('bg boppers', 0.9, 0.9);

		function onBeatHit()
			objectPlayAnimation('bg boppers','dance',false)
		end
	end

	makeLuaSprite('bopbad', 'BadBGBoppers',-554,-255)
	setScrollFactor('bopbad', 0.9, 0.9);
	
	if not lowQuality then
		addLuaSprite('bg boppers', false);
		scaleObject('bg boppers',1.28,1.28)
	end

	if lowQuality then
		addLuaSprite('bopbad', false);
		scaleObject('bopbad',1.28,1.28)
	end
end