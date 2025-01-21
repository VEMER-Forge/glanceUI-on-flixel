package glanceUI._internal;

class Loader
{
	public static function img(key:String = 'placeHolder', format:String = 'png')
		return 'assets/glanceUI/img/$key.$format';

	public static function imgUI(key:String = 'placeHolder', format:String = 'png')
		return 'assets/glanceUI/img/$key.$format';

	public static function font(key:String = 'TimesNewRoman', format:String = 'ttf')
		return 'assets/glanceUI/fonts/$key.$format';

	public static function sound(key:String = 'placeHolder', format:String = 'ogg')
		return 'assets/glanceUI/sounds/$key.$format';

	public static function file(key:String = 'placeHolder', format:String = 'txt')
		return 'assets/glanceUI/data/$key.$format';
}
