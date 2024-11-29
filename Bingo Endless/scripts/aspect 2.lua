function onCreatePost()
setTimeBarColors('FFFFFF', '1F1F1F')
	if upscroll then
    		setPropertyFromGroup('playerStrums', 0, 'y', 20);

    		setPropertyFromGroup('playerStrums', 1, 'y', 20);

    		setPropertyFromGroup('playerStrums', 2, 'y', 20);

    		setPropertyFromGroup('playerStrums', 3, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 0, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 1, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 2, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 3, 'y', 20);

	elseif downscroll then

		setPropertyFromGroup('playerStrums', 0, 'y', 600);

    		setPropertyFromGroup('playerStrums', 1, 'y', 600);

    		setPropertyFromGroup('playerStrums', 2, 'y', 600);

    		setPropertyFromGroup('playerStrums', 3, 'y', 600);

    		setPropertyFromGroup('opponentStrums', 0, 'y', 600);

    		setPropertyFromGroup('opponentStrums', 1, 'y', 600);

    		setPropertyFromGroup('opponentStrums', 2, 'y', 600);

    		setPropertyFromGroup('opponentStrums', 3, 'y', 600);
	else 
    		setPropertyFromGroup('playerStrums', 0, 'y', 20);

    		setPropertyFromGroup('playerStrums', 1, 'y', 20);

    		setPropertyFromGroup('playerStrums', 2, 'y', 20);

    		setPropertyFromGroup('playerStrums', 3, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 0, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 1, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 2, 'y', 20);

    		setPropertyFromGroup('opponentStrums', 3, 'y', 20);
	end
end

function onUpdatePost()
setProperty('timeTxt.y', getProperty('healthBar.y') -110)
setProperty('timeBar.y', getProperty('healthBar.y') -96)
setProperty('timeBarBG.y', getProperty('healthBar.y') -100)
end