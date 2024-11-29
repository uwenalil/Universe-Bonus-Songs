function onPause()
    if getPropertyFromClass('PlayState', 'chartingMode') then return end
    openCustomSubstate('FakePauseSubstate', true)
    return Function_Stop
end
function onCustomSubstateCreate(name)
    if name == 'FakePauseSubstate' then
        addHaxeLibrary('FlxText', 'flixel.text')
        addHaxeLibrary('FlxSound', 'flixel.system')
        addHaxeLibrary('Std')
        runHaxeCode([[
            curSelected = 0;
            menuItems = ['Continue', 'Restart', 'Exit', 'Quit'];
            grpMenuShit = [];

            changeSelection = function(?change = 0)
            {
                curSelected += change;
                FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                if (curSelected < 0)
                    curSelected = menuItems.length - 1;
                if (curSelected >= menuItems.length)
                    curSelected = 0;
        
                var bullShit = 0;
        
                for (item in grpMenuShit)
                {
                    item.targetY = bullShit - curSelected;
                    bullShit++;
        
                    item.alpha = 0.6;
        
                    if (item.targetY == 0)
                    {
                        item.alpha = 1;
                    }
                }
                game.setOnLuas('curSelectedPauseItem', menuItems[curSelected]);
            }

            bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFFffffff);
            bg.color = 0xFF000000;
            bg.alpha = 0;
            bg.scrollFactor.set();
            CustomSubstate.instance.add(bg);
    
            bgcool = new FlxSprite().loadGraphic(Paths.image('pause'));
            bgcool.alpha = 0;
            bgcool.scrollFactor.set();
            CustomSubstate.instance.add(bgcool);

            levelInfo = new FlxText(20, 15, 0, ']]..songName..[[', 32);
            levelInfo.scrollFactor.set();
            levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
            levelInfo.updateHitbox();
            CustomSubstate.instance.add(levelInfo);
    
            levelDifficulty = new FlxText(20, 15 + 32, 0, ']]..difficultyName:upper()..[[', 32);
            levelDifficulty.scrollFactor.set();
            levelDifficulty.setFormat(Paths.font('vcr.ttf'), 32);
            levelDifficulty.updateHitbox();
            CustomSubstate.instance.add(levelDifficulty);
    
            blueballedTxt = new FlxText(20, 15 + 64, 0, 'how many times you suck: ]]..tostring(getPropertyFromClass('PlayState', 'deathCounter'))..[[', 32);
            blueballedTxt.scrollFactor.set();
            blueballedTxt.setFormat(Paths.font('vcr.ttf'), 32);
            blueballedTxt.updateHitbox();
            CustomSubstate.instance.add(blueballedTxt);
    
            practiceText = new FlxText(20, 15 + 101, 0, "PRACTICE MDOE", 32);
            practiceText.scrollFactor.set();
            practiceText.setFormat(Paths.font('vcr.ttf'), 32);
            practiceText.x = FlxG.width - (practiceText.width + 20);
            practiceText.updateHitbox();
            practiceText.visible = game.practiceMode;
            CustomSubstate.instance.add(practiceText);
    
            chartingText = new FlxText(20, 15 + 101, 0, "CHARTING MODE", 32);
            chartingText.scrollFactor.set();
            chartingText.setFormat(Paths.font('vcr.ttf'), 32);
            chartingText.x = FlxG.width - (chartingText.width + 20);
            chartingText.y = FlxG.height - (chartingText.height + 20);
            chartingText.updateHitbox();
            chartingText.visible = game.chartingMode;
            CustomSubstate.instance.add(chartingText);
    
            blueballedTxt.alpha = 0;
            levelDifficulty.alpha = 0;
            levelInfo.alpha = 0;
    
            levelInfo.x = FlxG.width - (levelInfo.width + 20);
            levelDifficulty.x = FlxG.width - (levelDifficulty.width + 20);
            blueballedTxt.x = FlxG.width - (blueballedTxt.width + 20);
    
            FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
            FlxTween.tween(bgcool, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
            FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
            FlxTween.tween(levelDifficulty, {alpha: 1, y: levelDifficulty.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.5});
            FlxTween.tween(blueballedTxt, {alpha: 1, y: blueballedTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.7});

            for (i in 0...menuItems.length) {
                textThingy = new Alphabet(90, 320, menuItems[i], true);
                textThingy.isMenuItem = true;
                textThingy.targetY = i;
                grpMenuShit.push(textThingy);
                textThingy.screenCenter(0); //????????? idk if it will work like that
                textThingy.changeX = false;
                CustomSubstate.instance.add(textThingy);
            }
            changeSelection(0);

            pauseMusic = new FlxSound().loadEmbedded(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)), true, true);
            pauseMusic.volume = 0;
            pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));
            FlxG.sound.list.add(pauseMusic);
        ]])
    end
end
function onCustomSubstateUpdatePost(name, elapsed)
    if name == 'FakePauseSubstate' then
        runHaxeCode([[
            if (CustomSubstate.instance.controls.UI_DOWN_P) changeSelection(1);
            if (CustomSubstate.instance.controls.UI_UP_P) changeSelection(-1);
            if (pauseMusic.volume < 0.5) pauseMusic.volume += 0.01 * ]]..tostring(elapsed)..[[;
        ]])
        if getProperty('controls.ACCEPT') then
            if curSelectedPauseItem:lower() == 'continue' then
                closeCustomSubstate()
            elseif curSelectedPauseItem:lower() == 'restart' then
                restartSong()
            elseif curSelectedPauseItem:lower() == 'exit' then
                exitSong()
            elseif curSelectedPauseItem:lower() == 'quit' then
                os.exit()
            end
        end
    end
end
function onCustomSubstateDestroy(name)
    if name == 'FakePauseSubstate' then
        runHaxeCode([[
            pauseMusic.destroy();
        ]])
    end
end