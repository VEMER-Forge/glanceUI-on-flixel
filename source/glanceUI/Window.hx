package glanceUI;

import flixel.FlxG;
import glanceUI._internal.Loader;
import flixel.util.FlxSpriteUtil;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;

enum ButtonOverlay {
	ODefault;
}

class Window extends FlxSpriteContainer {
	var header:FlxSprite;
	var title:FlxText;
	var body:FlxSprite;

	var outline:FlxSprite;

	var buttons:Array<Button> = [];

	public function new(x = 0.0, y = 0.0, width:Int, height:Int, name:String, overlay:ButtonOverlay = ODefault) {
		super(x, y);

		header = new FlxSprite(0, -30).makeGraphic(width, 30, 0xFF0EB16F);
		add(header);

		title = new FlxText(4, -29, width / 2, name, 20);
		title.color = 0xFF000000;
		title.font = Loader.font('PixeloidMono');
		title.antialiasing = false;
		add(title);

		switch(overlay) {
			case ODefault:
				var buttonMargin = 0.0;

				var closeButton = new Button(header.width, 0, 'buttons/close', 23, kill);
				add(closeButton);
				closeButton.y = header.y + (header.height - closeButton.height) / 2;
				buttonMargin = closeButton.y - header.y;
				closeButton.x -= closeButton.width + buttonMargin;
				buttons.push(closeButton);

				var hideButton = new Button('buttons/hide', 23, hide);
				add(hideButton);
				hideButton.setPosition(closeButton.x - closeButton.width, closeButton.y);
				buttons.push(hideButton);
		}

		body = new FlxSprite().makeGraphic(width, height, 0xFF00FF97);
		add(body);

		outline = new FlxSprite(-2, -32).makeGraphic(Math.ceil(this.width) + 4, Math.ceil(this.height) + 4, 0x00000000);
		FlxSpriteUtil.drawRect(outline, 0, 0, this.width + 4, this.height + 4, 0xFF000000);
		outline.antialiasing = false;
		insert(0, outline);
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

	public function hide() {
		visible = active = false;
	}

	public function show() {
		visible = active = true;
	}
}
