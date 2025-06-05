package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.utils.Assets;

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(0, 0, PlayState, 165, 165));
	}
}
