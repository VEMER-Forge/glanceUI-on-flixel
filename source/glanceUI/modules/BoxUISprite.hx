package glanceUI.modules;

import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;
import glanceUI._internal.theme.Theme;
// import glanceUI._internal.crashHandlers.ScaleHandler;

class BoxUISprite extends FlxSpriteContainer {

	public var _width:Int = 0;
	public var _height:Int = 0;

	var outline:FlxSprite;
	var body:FlxSprite;

	public function new(x:Float, y:Float, width:Int, height:Int) {

		super(x,y);

		_width = width;
		_height = height;

		outline = new FlxSprite(-2, -2).makeGraphic(width + 4, height + 4, Theme.lineColor);
		add(outline);

		body = new FlxSprite(0, 0).makeGraphic(width, height, Theme.mainColor);
		add(body);
	}
}
