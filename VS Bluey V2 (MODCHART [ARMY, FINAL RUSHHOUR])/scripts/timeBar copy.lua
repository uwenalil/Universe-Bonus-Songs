function onCreatePost()
  addHaxeLibrary('Main');
	runHaxeCode([[
		Main.fpsVar.defaultTextFormat = new openfl.text.TextFormat("bluey.ttf", 25, 10);
	]]);
end