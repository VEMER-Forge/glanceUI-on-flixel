package glanceUI;

import flixel.FlxG;
import glanceUI._internal.Loader;
import flixel.util.FlxSpriteUtil;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;
import glanceUI._internal.TextUI;

enum ButtonOverlay {
	ODefault;
}

class Window extends FlxSpriteContainer {
	var header:FlxSprite;
	var title:FlxText;

	var testTxt:TextUI;
	var body:FlxSprite;

	var outline:FlxSprite;

	var buttons:Array<Button> = [];

	public var content:FlxSpriteContainer;

	public function new(x = 0.0, y = 0.0, width:Int, height:Int, name:String, overlay:ButtonOverlay = ODefault) {
		super(x, y);

		header = new FlxSprite(0, -30).makeGraphic(width, 30, 0xFF0EB16F);
		add(header);

		testTxt = new TextUI(4, -29, 20, name);
		testTxt.color = 0xFF000000;
		testTxt.antialiasing = false;
		add(testTxt);

		switch(overlay) {
			case ODefault:
				var buttonMargin = 0.0;

				var closeButton = new Button(header.width, 0, 'buttons/close', 23, bye);
				add(closeButton);
				closeButton.y = header.y + (header.height - closeButton.height) / 2;
				buttonMargin = closeButton.y - header.y;
				closeButton.x -= closeButton.width + buttonMargin;
				buttons.push(closeButton);
		}

		body = new FlxSprite().makeGraphic(width, height, 0xFF00FF99);
		add(body);

		outline = new FlxSprite(-2, -32).makeGraphic(Math.ceil(this.width) + 4, Math.ceil(this.height) + 4, 0x00000000);
		FlxSpriteUtil.drawRect(outline, 0, 0, this.width + 4, this.height + 4, 0xFF000000);
		outline.antialiasing = false;
		insert(0, outline);

		content = new FlxSpriteContainer();
		add(content);
	}

	var dragging = false;
	override function update(elapsed:Float) {
		if (FlxG.mouse.justPressed) {
			var overlapped = false;
			for (camera in cameras) {
				if (FlxG.mouse.overlaps(header, camera)) overlapped = true;
				for (button in buttons) if (FlxG.mouse.overlaps(button, camera)) overlapped = false;
			}

			if (overlapped) dragging = true;
		}
		if (FlxG.mouse.justReleased) dragging = false;

		if (dragging) {
			x += FlxG.mouse.deltaX;
			y += FlxG.mouse.deltaY;
		}

		super.update(elapsed);
	}

	function bye() {
		this.kill();
		Mouse.changeCursor(AUTO);
	}
}
