function onUpdatePost(elapsed)
setProperty('timeBar.scale.x', getProperty('healthBar.scale.x') + 1.01)
setProperty('timeBarBG.scale.x', getProperty('healthBarBG.scale.x') + 1)

setProperty('timeBar.y', 645)
setProperty('timeBar.flipX', true) 

setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
end