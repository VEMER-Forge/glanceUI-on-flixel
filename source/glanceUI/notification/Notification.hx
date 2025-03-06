package glanceUI.notification;

import flixel.group.FlxSpriteContainer;
import glanceUI.BoxUISprite;
import glanceUI._internal.TextUI;

class Notification extends FlxSpriteContainer {

	static var spriteContent:FlxSpriteContainer = new FlxSpriteContainer();
	var titleStatus:TextUI;
	var descText:TextUI;

	public function new(x:Float = 0, y:Float = 0, type:String = 'info', data:String = 'this is notification') {
		super(x, y);

		this.x = x;
		this.y = y;

		add(spriteContent);

		createBG(x, y, type, data);

		// this.visible = false;

	}

	public static function createBG(x:Float, y:Float, type:String, data:String) {
		wipeGroup(spriteContent);

		var bg:BoxUISprite = new BoxUISprite(this.x, this.y, 300, 200);
		spriteContent.add(bg);


	}

	public static function wipeGroup(group:FlxSpriteContainer){
			for (obj in group)
				obj.destroy();

			group.clear();
	}
}
