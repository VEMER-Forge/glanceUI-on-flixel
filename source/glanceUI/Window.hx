package glanceUI;

// import glanceUI._internal.TextUI;
// import glanceUI._

enum ButtonOverlay {
	ODefault;
}

class Window extends FlxSpriteContainer {
	var header:FlxSprite;
	// var title:FlxText;

	var title:TextUI;
	var body:FlxSprite;

	var outline:FlxSprite;
	var buttons:Array<Button> = [];

	public var content:FlxSpriteContainer;

	var scaleWindow:Array<Int> = [0, 0];
	var dragging = false;

	public function new(x = 0.0, y = 0.0, width:Int, height:Int, name:String, overlay:ButtonOverlay = ODefault) {
		super(x, y);

		buttons = [];

		scaleWindow[0] = width;
		scaleWindow[1] = height;

		header = new FlxSprite(0, -30).makeGraphic(width, 30, Theme.foreignColor);
		add(header);

		title = new TextUI(4, -29, 20, name);
		// title.color = Theme.textColor;
		title.antialiasing = false;
		add(title);

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

		body = new FlxSprite().makeGraphic(width, height, Theme.mainColor);
		add(body);

		outline = new FlxSprite(-2, -32).makeGraphic(Math.ceil(this.width) + 4, Math.ceil(this.height) + 4, 0x00FFFFFF);
		FlxSpriteUtil.drawRect(outline, 0, 0, this.width + 4, this.height + 4, Theme.lineColor);
		outline.antialiasing = false;
		insert(0, outline);

		content = new FlxSpriteContainer();
		add(content);
	}

	// Window handle made by mr_chaoss
	override function update(elapsed:Float) {
		handleDrag();
		super.update(elapsed);
	}

	private function handleDrag():Void {
		if (FlxG.mouse.justPressed) {
			var overlapped = isMouseOver();
			if (overlapped) dragging = true;
		}

		if (FlxG.mouse.justReleased) dragging = false;

		if (dragging) {
			x += FlxG.mouse.deltaX;
			y += FlxG.mouse.deltaY;
		}
	}

	private function isMouseOver():Bool {
		for (camera in cameras) {
			if (FlxG.mouse.overlaps(header, camera)) {
				for (button in buttons) {
					if (FlxG.mouse.overlaps(button, camera)){
						return false;
					}
				}
				return true;
			}
		}
		return false;
	}

	override public function revive() {
		updateColor();
		super.revive();
	}

	// colors by mr_chaoss
	private function updateColor() {
		header.makeGraphic(scaleWindow[0], 30, Theme.foreignColor);
		body.makeGraphic(scaleWindow[0], scaleWindow[1], Theme.mainColor);
		title.color = Theme.textColor;
		FlxSpriteUtil.drawRect(outline, 0, 0, this.width + 4, this.height + 4, Theme.lineColor);
	}

	function bye() {
		this.kill();
		Mouse.changeCursor(AUTO);
	}
}
