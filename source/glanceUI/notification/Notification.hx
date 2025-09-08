package glanceUI.notification;

import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.group.FlxSpriteContainer;
import glanceUI._internal.Loader;
import glanceUI._internal.theme.Theme;
import glanceUI.modules.*;

class Notification extends FlxSpriteContainer {

	var spriteContent:FlxSpriteContainer = new FlxSpriteContainer();

	public var _height:Int = 120;
	public var _width:Int = 400;

	var timer:FlxTimer = new FlxTimer();

	public static var tweenY:Float = 0;
	public static var tweenBackY:Float = 0;
	public static var downTween:Bool = false;
	public static var scaleIcon:Float = 6;



	public function new(x:Float = 0, y:Float = 0) {
		super(x, y);

		this.x = x;
		this.y = y;

		tweenY = y + 10;
		tweenBackY = y;

		add(spriteContent);

		this.alpha = 0;

	}

	public function createBG(x:Float = 0, y:Float = 0, type:String = "none", data:String = "this is test text", hideButt:Bool = true) {
		var text:TextUI = new TextUI(100, 40, 16, data);
		text.color = Theme.lineColor;

		_height = FlxMath.maxInt(Std.int(text.textField.textHeight + (text.y * 1.2)), 120);
		wipeGroup(spriteContent);

		var bg:BoxUISprite = new BoxUISprite(x, y, _width, _height);
		spriteContent.add(bg);

		var icon:Icon = new Icon(20, 10, scaleIcon, type);
		icon.y = (bg._height - icon.height) / 2;
		spriteContent.add(icon);

		var title:TextUI = new TextUI(10, 5, 16, type.toUpperCase());
		title.color = Theme.lineColor;
		spriteContent.add(title);


		spriteContent.add(text);
	}

	public static function wipeGroup(group:FlxSpriteContainer){
			for (obj in group)
				obj.destroy();

			group.clear();
	}

	public function show(type:String = "warning", data:String = "this is a test\ntext for notification", hideButton:Bool = true){
		_reset();
		createBG(0, 0, type, data);
		FlxTween.tween(this,{alpha: 1, y:tweenY}, 0.25, {ease: FlxEase.cubeInOut});
		timer.start(10, function(timer:FlxTimer) {
			hide();
	  	});
	}

	public function hide(){
		FlxTween.tween(this,{alpha: 0, y:tweenBackY}, 0.25, {ease: FlxEase.cubeInOut});
	}

	public function _reset() {
		y = tweenBackY;
		alpha = 0;
		FlxTween.cancelTweensOf(this);
		timer.cancel();
	}
}
