package glanceUI.taskBar;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer;
import flixel.FlxG;
import flixel.text.FlxText;


class TaskBar extends FlxSpriteContainer {
		var bar:FlxSprite;
		var outline:FlxSprite;
		var versionTxt:FlxText;

		public function new(up:Bool = true) {
			super();
			bar = new FlxSprite(0, 0).makeGraphic(FlxG.width, 25, 0xFF0EB16F);
			add(bar);
		}
}
