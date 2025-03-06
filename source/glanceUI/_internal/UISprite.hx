package glanceUI._internal;

import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;
import flixel.util.FlxSpriteUtil;
// import glanceUI._internal.crashHandlers.ScaleHandler;

class UISprite extends FlxSpriteContainer {

	public var _width:Int = 0;
	public var _height:Int = 0;

	var outline:FlxSprite;
	var body:FlxSprite;

	public function new(width:Int, height:Int) {
		super();
		_width = width;
		_height = height;

		outline = new FlxSprite(-2, -32).makeGraphic(Math.ceil(this.width) + 4, Math.ceil(this.height) + 4, 0xFF000000);
		outline.antialiasing = false;
		add(outline);

		body = new FlxSprite(0,0).makeGraphic(_width, _width, 0xFF00FF99);
		add(body);

		trace('hujna');
	}
}
