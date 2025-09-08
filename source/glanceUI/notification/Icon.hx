package glanceUI.notification;

import flixel.FlxSprite;
import glanceUI._internal.Loader;

class Icon extends FlxSprite {

	public function new(x:Float, y:Float, size:Float, type:String) {
		super(x, y);
		loadGraphic(Loader.img("notification/icons/" + type));
		scale.set(size, size);
		this.updateHitbox();
	}
}
