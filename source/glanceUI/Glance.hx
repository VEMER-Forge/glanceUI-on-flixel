package glanceUI;

import flixel.FlxG;
import glanceUI._internal.theme.Config;

class Glance {

	public static var systemCursor:Bool = true;

	public static function init() {
		FlxG.mouse.useSystemCursor = systemCursor;
		for(i in [Config])
			i.init();
	}
}
