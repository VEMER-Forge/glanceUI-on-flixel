package glanceUI.buttons;

import flixel.FlxG;
import flixel.system.FlxAssets;
import glanceUI._internal.Loader;
import flixel.FlxSprite;

class Button extends FlxSprite {
	public var onClick:()->Void;

	public function new(x = 0.0, y = 0.0, texture = 'buttons/button', size:Float, ?onClick:()->Void) {
		super(x, y);
		this.onClick = onClick;

		var bmp = FlxAssets.getBitmapData(Loader.img(texture));
		loadGraphic(bmp, true, Math.floor(bmp.width / 2), bmp.height);
		animation.add('button', [0, 1], 0, false);
		animation.play('button');

		setGraphicSize(size, size);
		updateHitbox();
		antialiasing = false;
	}

	var clicked = false;
	override function update(elapsed:Float) {
		var overlapped = false;
		for (camera in cameras) if (FlxG.mouse.overlaps(this, camera)) overlapped = true;

		animation.curAnim.curFrame = overlapped ? 1 : 0;

		if(overlapped)
			Mouse.changeCursor(BUTTON);
		else
			Mouse.changeCursor(AUTO);

		super.update(elapsed);

		if (FlxG.mouse.justPressed && overlapped) clicked = true;
		if (FlxG.mouse.justReleased) {
			if (overlapped && clicked) {
				if (onClick != null) onClick();
			} else clicked = false;
		}
	}
}
