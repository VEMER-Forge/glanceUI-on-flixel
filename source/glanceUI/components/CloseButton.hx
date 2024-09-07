package glanceUI.components;

import openfl.display.BitmapData;
import openfl.Assets;
import glanceUI.utils.Loader;
import flixel.FlxSprite;
import flixel.FlxG;

class CloseButton extends FlxSprite {
		private var anim:Array<Float> = [0, 0];
		private var char:String = '';

		public function new(x:Float, y:Float, size:Float) {
			super( x, y);

			var graphic:BitmapData;
			graphic = Assets.getBitmapData(Loader.img('buttons/close'), false);

			loadGraphic(graphic, true, Math.floor(graphic.width / 2), Math.floor(graphic.height));
			anim[0] = (width - 150) / 2;
			anim[1] = (height - 150) / 2;

			//adding anim
			animation.add('static', [0], 0, false);
			animation.add('selected', [1], 0, false);

			animation.play('static');
			scale.set(size, size);
			antialiasing = false;
			updateHitbox();
		}

		override function update(elapsed:Float) {
			if(FlxG.mouse.overlaps(this)){
				animation.play('selected');
			}
			else
				animation.play('static');

			super.update(elapsed);
		}
}
