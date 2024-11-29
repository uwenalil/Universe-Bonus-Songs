function onCreate()
	makeAnimatedLuaSprite('speakerbox', 'bg/speaker_bluey', 0, 240);
	addAnimationByPrefix('speakerbox', 'first', 'speaker beat', 15, false);
	objectPlayAnimation('speakerbox', 'first');
	setScrollFactor('speakerbox', 0.9, 0.9);
end

function onBeatHit()
	if curBeat % 1 == 0 then
		playAnim('speakerbox', 'first');
	end
end