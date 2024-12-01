-- COMBO COUNTER PLUS
-- by SilverSpringing

-- Please, PLEASE credit me if you intend on using this for a mod.
-- You wouldn't like it if I didn't credit you for something you made, right? It's only fair.

-- PhantomMuff font by Cracsthor on Gamebanana: https://gamebanana.com/tools/7763
-- Psych Engine by Shadow Mario: https://github.com/ShadowMario/FNF-PsychEngine

-- OPTIONS -----------------------------------------------------------------------------------

-- Colored Text
coloredText = true
-- Will change text color depending on the note hit rating.

-- Dynamic Animations
dynamicAnimations = true
-- Depending on the note hit rating, different animations will play if this is set to true.

--- ACTUAL CODE ------------------------------------------------------------------------------ 
function onCreatePost()
	local comboTextX = getProperty('botplayTxt.x') + 40
	
	makeLuaText('comboTxt', '', 400, comboTextX, 155)
	setTextSize('comboTxt', 42)
	setTextBorder('comboTxt', 3, '000000')
	setTextFont('comboTxt', 'bluey.ttf')
	setTextAlignment('comboTxt', 'center')
	addLuaText('comboTxt')	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	
	local rawNoteRating = getPropertyFromGroup('notes', id, 'rating')
	local noteRating = rawNoteRating
	
	if coloredText then
		local colorScore = "FFFFFF"
	end
	
	if not isSustainNote then
		if rawNoteRating == 'sick' then
			noteRating = "For Real Life!!"
			if coloredText then
				colorScore = "FFF09E"	
			end
		elseif rawNoteRating == 'good' then
			noteRating = "Awesome!"
			if coloredText then
				colorScore = "9BF074"
			end
		elseif rawNoteRating == 'bad' then
			noteRating = "Meh.."
			if coloredText then
				colorScore = "E03E3E"
			end
		elseif rawNoteRating == 'shit' then
			noteRating = "not dollar bucks :c"
			if coloredText then
				colorScore = "6D6C99"
			end
		else
			noteRating = "what"
			if coloredText then
				colorScore = "FFFFFF"
			end
		end
	end
		
	setProperty('comboTxt.scale.x', 1.3)
	setProperty('comboTxt.scale.y', 1.3)
	setProperty('comboTxt.alpha', 1)
	cancelTween('comboTxtAlphaTween')
	
	if not isSustainNote then
		setTextString('comboTxt', noteRating .. "\n" .. getProperty('combo'))
	end
	
	if coloredText then
		setTextColor('comboTxt', colorScore)
	end
	
	doTweenX('scaleTweenX', 'comboTxt.scale', 1, 0.9, 'expoOut');
	doTweenY('scaleTweenY', 'comboTxt.scale', 1, 0.9, 'expoOut');
	doTweenAlpha('comboTxtAlphaTween', 'comboTxt', 0, 0.6, 'linear')
end

function onTweenCompleted(tag)
	if tag == 'comboTxtAlphaTween' then
		comboTxt.alpha = 0
	end
end