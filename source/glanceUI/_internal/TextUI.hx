package glanceUI._internal;

import flixel.FlxSprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.BitmapData;
import glanceUI._internal.Loader;
import flixel.group.FlxSpriteContainer;


/**
 text maded on openFL for better render text
 but dosen't have features like FlxTextFormat idk

 write VEMER
 хуйня полная
 */

class TextUI extends FlxSpriteContainer {

	public var text:String;

	private var textField:TextField;
	private var textSprite:FlxSprite; // for render

	public function new(x:Float = 0, y:Float = 0, size:Int = 8, _text:String = 'hello openFL', color:Int = 0xFFFFFFFF){
		super( x, y);

		text = _text;

		textField = new TextField();
		textField.text = text;
		textField.x = 10;
		textField.y = 10;

		var format = new TextFormat();
		format.size = size;
		format.font = Loader.font('PixeloidMono');
		format.color = 0xFFFFFFFF;
		// textField.fieldWidth = 0;
		textField.setTextFormat(format);


		var sprite = new BitmapData(Std.int(textField.width), Std.int(textField.height), true, 0x00000000);
		sprite.draw(textField);

		textSprite = new FlxSprite();
		textSprite.antialiasing = false;
		textSprite.pixels = sprite;
		add(textSprite);

		this.color = color;
	}
}
