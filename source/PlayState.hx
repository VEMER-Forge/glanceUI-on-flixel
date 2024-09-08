package;

import flixel.FlxG;
import flixel.FlxState;

import glanceUI.*;


class PlayState extends FlxState {
	var window:Window;

	override public function create() {

		bgColor = 0x616161;

		window = new Window(10, 40, 800, 500, 'TEST');
		add(window);

		// var huj:TaskBar = new TaskBar(false);
		// add(huj);

		super.create();
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.justPressed.R) window.show();
		super.update(elapsed);
	}
}
