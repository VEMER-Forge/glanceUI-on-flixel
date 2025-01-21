package glanceUI._internal;

import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;
// import glanceUI._internal.crashHandlers.ScaleHandler;

class UISprite extends FlxSpriteContainer {

	public var _width:Int = 0;
	public var _height:Int = 0;

	var outline:FlxSprite;
	var body:FlxSprite;

	public function new() {

		super();

		trace('hujna');
	}
}
