function onCreate()
	makeAnimatedLuaSprite('blueydancer', 'bg/bluey', -600, 320);
	addAnimationByIndices('blueydancer', 'left', 'bluey idle','0,1,2,3', 14);
	addAnimationByIndices('blueydancer', 'right', 'bluey idle','4,5,6,7', 14);
	setScrollFactor('blueydancer', 1, 1);
	scaleObject('blueydancer', 1, 1);
	
	
	makeAnimatedLuaSprite('bingodancer', 'bg/bingo', -600, 320);
	addAnimationByIndices('bingodancer', 'beat', 'bingo idle','0,1,2,3', 14);
	setScrollFactor('bingodancer', 1, 1);
	scaleObject('bingodancer', 1, 1);
end

function onBeatHit()
	if curBeat % 1 == 0 then
		playAnim('blueydancer', 'left');
		playAnim('bingodancer', 'beat');
	end
	if curBeat % 2 == 0 then
		playAnim('blueydancer', 'right');
		playAnim('bingodancer', 'beat');
	end
end