package glanceUI._internal;

import flixel.util.FlxSave;
import flixel.FlxG;

class Loader
{
	public static function img(key:String = 'glanceLogo', format:String = 'png')
		return 'assets/glanceUI/img/$key.$format';

	public static function imgUI(key:String = 'placeHolder', format:String = 'png')
		return 'assets/glanceUI/img/$key.$format';

	public static function font(key:String = 'TimesNewRoman', format:String = 'ttf')
		return 'assets/glanceUI/fonts/$key.$format';

	public static function sound(key:String = 'placeHolder', format:String = 'ogg')
		return 'assets/glanceUI/sounds/$key.$format';

	public static function file(key:String = 'placeHolder', format:String = 'txt')
		return 'assets/glanceUI/data/$key.$format';

	@:access(flixel.util.FlxSave.validate)
	inline public static function getSavePath():String {
		final company:String = FlxG.stage.application.meta.get('company');
		// #if (flixel < "5.0.0") return company; #else
		return '${company}/${flixel.util.FlxSave.validate(FlxG.stage.application.meta.get('file'))}';
		// #end
	}
}
