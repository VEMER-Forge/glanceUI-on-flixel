package;

import flixel.FlxState;

import glanceUI.*;


class PlayState extends FlxState {
	override public function create() {

		bgColor = 0x616161;

		var test:Window = new Window(10, 10, 800, 500, 'TEST');
		add(test);

		var huj:TaskBar = new TaskBar(false);
		add(huj);

		super.create();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
