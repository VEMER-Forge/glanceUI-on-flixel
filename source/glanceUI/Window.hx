package glanceUI;

import glanceUI.components.CloseButton;
import glanceUI.components.HideButton;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;
// import flixel.group.FlxSpriteContainer;

import glanceUI.utils.Loader;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class Window extends FlxTypedSpriteGroup<FlxSprite>
{
	var hitbox:FlxSprite;

	var border:FlxSprite;
	var maker:FlxSprite;

	var title:FlxText;

	var closeButton:CloseButton;
	var hideButton:HideButton;

	// var container:FlxSpriteContainer;

	public function new(x:Float, y:Float, width:Int, height:Int, name:String)
	{
		super(x, y);

		border = new FlxSprite(x, y).makeGraphic(width + 4, height + 4, 0xFF000000);
		border.antialiasing = false;
		add(border);

		maker = new FlxSprite(x + 2, y + 2).makeGraphic(width, height, 0xFF00FF97);
		maker.antialiasing = false;
		add(maker);

		title = new FlxText(x + 4, y + 1, width / 2, name, 20);
		title.color = 0xFF000000;
		title.font = Loader.font('PixeloidMono');
		title.antialiasing = false;
		add(title);

		hitbox = new FlxSprite(x, y).makeGraphic(width + 4, 30, 0x28008A50);
		hitbox.antialiasing = false;
		add(hitbox);

		closeButton = new CloseButton(maker.width - 13 , y + 4, 2.3);
		add(closeButton);

		hideButton = new HideButton(maker.width - 40 , y + 4, 2.3);
		add(hideButton);
	}

	override function update(elapsed:Float) {

		if(FlxG.mouse.overlaps(hitbox) && FlxG.mouse.pressed)
		{
			hitbox.x += FlxG.mouse.deltaX;
         hitbox.y += FlxG.mouse.deltaY;

			border.x = hitbox.x;
			border.y = hitbox.y;

			maker.x = border.x + 2;
			maker.y = border.y + 2;

			title.x = maker.x + 2;
			title.y = border.y + 1;

			closeButton.x = maker.x + hitbox.width - 29;
			closeButton.y = hitbox.y + 4;

			hideButton.x = maker.x + hitbox.width - 59;
			hideButton.y = hitbox.y + 4;
		}

		super.update(elapsed);
	}
}
