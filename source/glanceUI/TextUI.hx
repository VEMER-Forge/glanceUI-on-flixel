package glanceUI;

import flixel.text.FlxText;
import glanceUI._internal.Loader;
import glanceUI._internal.theme.Theme;

class TextUI extends FlxText {

	public function new(x:Float = 0, y:Float = 0, text:String = "placeholder", size:Int = 8) {
		super(x, y, text, size);
		setFormat(Loader.font('PixeloidMono'), size, Theme.textColor);
	}
}
