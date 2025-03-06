package glanceUI._internal.theme;

class Theme {

	public static var mainColor:Int = 0xFF00FF99;
	public static var foreignColor:Int = 0xFF0EB16F;
	public static var textColor:Int = 0xFF000000;
	public static var lineColor:Int = 0xFF000000;
	public static var nameTheme:String = "default";

	public static function setTheme() {
		mainColor = Std.parseInt(Config.curThemeFile.mainColor);
		foreignColor = Std.parseInt(Config.curThemeFile.mainColor);
		textColor = Std.parseInt(Config.curThemeFile.textColor);
		lineColor = Std.parseInt(Config.curThemeFile.lineColor);
		nameTheme = Config.curThemeFile.nameTheme;
	}
}
