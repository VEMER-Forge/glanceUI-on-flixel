package glanceUI.buttons;

import flixel.group.FlxSpriteContainer;
import glanceUI.modules.*;

class TxtButton extends FlxSpriteContainer {

	var body:BoxUISprite;
	var text:TextUI;

	var scaleButton:Array<Int> = [100, 100];

	public function new(x:Int, y:Int, text = 'TEXT\nТЕКСТ' ,width:Int = 100, height:Int = 100) {
		super(x, y);

		scaleButton[0] = width;
		scaleButton[1] = height;


	}

	function createButton() {

	}
}
