-- Script by Raltyro
-- Originally Made for 900n1 Mod :D
-- 12/20/2022

-- Score Formats - %score, %misses, %rating, %percent, %health
noRatingScoreFormat = ''
scoreFormat = 'Health: %health // Misses: %misses // Rating: %rating'
percentDecimals = 2

-- Ratings - {percent - 0 to 100, ratingname} (orders doesn't matter)
noRatingName = ''
ratingNames = {
	{100, "Perfect!!"},
	{90, "Sick!"},
	{80, "Great"},
	{70, "Good"},
	{69, "Nice"},
	{60, "Meh"},
	{50, "Bruh"},
	{40, "Bad"},
	{20, "Shit"},
	{0, "You Suck!"}
}

local errors
function updateRating()
	luaDebugMode = true
	local percent, rating = tonumber(getProperty("ratingPercent")) * 100, noRatingName
	local health = math.max(0, math.min(getHealth() * 50, 100))
	local showAcc = hits ~= 0

	if showAcc then
		local v
		for i = #ratingNames, 1, -1 do
			v = ratingNames[i]
			if (percent >= v[1]) then
				rating = v[2]
			else
				break
			end
		end
	end

	local decimals = 10 ^ percentDecimals
	percent = math.floor(percent * decimals) / decimals

	local str = showAcc and scoreFormat or noRatingScoreFormat
	str = str:gsub('%%score', score)
	str = str:gsub('%%misses', misses)
	str = str:gsub('%%rating', rating)
	str = str:gsub('%%percent', percent)
	str = str:gsub('%%health', health)

	setTextString("scoreTxt", str)
end

-- backwards compatibility
function onUpdateScore()
	onUpdate = nil; onUpdateScore = updateRating
	return updateRating()
end

onUpdate = updateRating