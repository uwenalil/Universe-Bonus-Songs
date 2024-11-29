dad = {
    ['none'] = {
        {80, 100}, -- lose
        {20, 80}, -- normal
        {20, 0} -- win
    },
    ['none'] = {
        {80, 100}, -- lose
        {20, 80}, -- normal
        {20, 0} -- win
    }
}
bf = {
    ['furrybf-encore'] = {
        {20, 0}, -- lose
        {80, 20}, -- normal
        {100, 80} -- win
    }
}
local dadamount
local bfamount
function onCreatePost()
    luaDebugMode = true
    local arraydad = {}
    local arraybf = {}
    dadamount = 0
    bfamount = 0
    if dad[dadName] then
        for i = 1, #dad[dadName] do
            arraydad[i] = i-1
            dadamount = dadamount + 1
        end
    end
    if bf[boyfriendName] then
        for j = 1, #bf[boyfriendName] do
            arraybf[j] = j-1
            bfamount = bfamount + 1
        end
    end
    if dadamount > 0 then
        loadGraphic('iconP2', 'icons/icon-'..getProperty('dad.healthIcon'))
        local width = getProperty('iconP2.width')
        loadGraphic('iconP2', 'icons/icon-'..getProperty('dad.healthIcon'), width / dadamount)
        addAnimation('iconP2', 'idle', arraydad, 0, true)
        playAnim('iconP2', 'idle')
    end
    if bfamount > 0 then
        loadGraphic('iconP1', 'icons/icon-'..getProperty('boyfriend.healthIcon'))
        local width = getProperty('iconP1.width')
        loadGraphic('iconP1', 'icons/icon-'..getProperty('boyfriend.healthIcon'), width / bfamount)
        addAnimation('iconP1', 'idle', arraybf, 0, true)
        playAnim('iconP1', 'idle')
        setProperty('iconP1.flipX', true)
    end
end
function onUpdatePost()
    if dadamount > 0 then
        setProperty('iconP2.offset.y', 0)
        for i = 1, #dad[dadName] do
            hp = getProperty('healthBar.percent')
            if (hp <= dad[dadName][i][1]) and (hp > dad[dadName][i][2]) then
                setProperty('iconP2.animation.curAnim.curFrame', (i-1))
            end
        end
    end
    if bfamount > 0 then
        setProperty('iconP1.offset.y', 0)
        for i = 1, #bf[boyfriendName] do
            hp = getProperty('healthBar.percent')
            if (hp <= bf[boyfriendName][i][1]) and (hp > bf[boyfriendName][i][2]) then
                setProperty('iconP1.animation.curAnim.curFrame', (i-1))
            end
        end
    end 
end