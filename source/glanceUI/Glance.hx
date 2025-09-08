package glanceUI;

import flixel.FlxG;

class Glance {

	public static var systemCursor:Bool = true;

	public static function init() {
		FlxG.mouse.useSystemCursor = systemCursor;


		// for(i in [Config, Theme])
		// 	i.init();

		Config.init();
	}
}
