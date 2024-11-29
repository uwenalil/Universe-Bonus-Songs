function onCreatePost()
	setProperty('scoreTxt.visible', false);
	setProperty('timeBarBG.visible', false);
	setProperty('timeBar.visible', true);
	setTextFont('timeTxt', 'Arial.ttf');

	setTimeBarColors('FF0700', '333433')

	makeLuaSprite('ytb', 'youtube', 0, 0);
	setObjectCamera('ytb', 'other');
	addLuaSprite('ytb', false);

	--setProperty('timeBar.y', 695);
	scaleObject('timeBar', 3.2, 0.6)
	setObjectCamera('timeBar','other')
	screenCenter('timeBar')
	setProperty('timeBar.y', 680);

	
	setProperty('timeTxt.y', 695);
	setProperty('timeTxt.x', 64);
	scaleObject('timeTxt', 0.5, 0.5);
	setObjectCamera('timeTxt','other')
	setTextColor('timeTxt', 'D0D0D0')
end

function onUpdate()
	--[[
	makeLuaSprite('timeBarFC', '', 0, 710);
	makeGraphic('timeBarFC', 1280, 10, '424145');
	setObjectCamera('timeBarFC','other')
	addLuaSprite('timeBarFC', false);

	makeLuaSprite('timeBarFD', '', 0, 710);
	makeGraphic('timeBarFD', curStep, 10, '908F91');
	setObjectCamera('timeBarFD','other')
	addLuaSprite('timeBarFD', false);

	makeLuaSprite('timeBarF', '', 0, 710);
	makeGraphic('timeBarF', curStep/ 1.2, 10, 'FF0000');
	setObjectCamera('timeBarF','other')
	addLuaSprite('timeBarF', false);
	]]
end