hasChanged = false
function onUpdate()
	if keyboardJustPressed('NINE') and boyfriendName == 'bf' then
		runHaxeCode([[
			game.iconP1.swapOldIcon();
		]]);
	end
end
