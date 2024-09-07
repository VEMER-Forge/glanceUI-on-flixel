package glanceUI;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class TaskBar extends FlxTypedSpriteGroup<FlxSprite> {

	var border:FlxSprite;

	public function new(down:Bool = false) {

		super();

		var y:Float = 0;
		if(down)
			y = FlxG.height + 40;
		else
			y = 0;

		border = new FlxSprite(FlxG.width, y).makeGraphic(FlxG.width, 40, 0xFF000000);
		border.antialiasing = false;
		add(border);


	}
}
