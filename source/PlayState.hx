package;

import flixel.addons.ui.FlxInputText;
import flixel.FlxG;
import flixel.FlxState;
import sys.FileSystem;

import glanceUI.*;
import glanceUI.taskBar.TaskBar;



class PlayState extends FlxState {
	var window:Window;
	var bar:TaskBar;

	var input:FlxInputText;

	override public function create() {

		FlxG.camera.bgColor = 0xFF616161;

		// FlxG.camera.pixelPerfectRender = true;

		// bar = new TaskBar(true, 'lol');
		// add(bar);

		window = new Window(10, 40, 800, 500, 'TEST');
		add(window);

		input = new FlxInputText(window.x + 20, window.y + 20, 200, "Text Box", 12, 0xFF000000, 0xFF0EB16F);
		window.content.add(input);


		var huj:TaskBar = new TaskBar(false);
		add(huj);

		super.create();
		 // Path to the folder
		 var folderPath:String = "assets/glanceUI/data/themes/";

		 // Get the list of files in the folder
		 var files:Array<String> = FileSystem.readDirectory(folderPath);

		 // Print the list of files
		 for (file in files)
		 {
			  trace(file);
		 }
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.justPressed.R) window.revive();
		super.update(elapsed);
	}
}
