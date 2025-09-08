package glanceUI;

import flixel.text.FlxText;
import glanceUI._internal.Loader;
import glanceUI._internal.theme.Theme;

class TextUI extends FlxText {

	public function new(x:Float = 0, y:Float = 0, _size:Int = 8, text:String = "placeholder") {
		super(x, y, text, _size);
		this.setFormat(Loader.font('PixeloidMono'), _size, Theme.textColor);
		this.color = Theme.textColor;
	}
}
