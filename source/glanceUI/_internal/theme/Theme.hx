package glanceUI._internal.theme;

typedef ThemeType = {
	name_col:String,
	main_col:String,
	foreign_col:String,
	text_col:String,
	line_col:String,
}

class Theme {

	// i was thinking to change the themes, so here you go -- mr_chaoss

	public static var mainColor(default, null):Int;
	public static var foreignColor(default, null):Int;
	public static var textColor(default, null):Int;
	public static var lineColor(default, null):Int;
	public static var nameTheme(default, null):String;

	public static function applyTheme(theme:ThemeType) {
		if(theme == null) return;

		mainColor = Std.parseInt(theme.main_col);
		foreignColor = Std.parseInt(theme.foreign_col);
		textColor = Std.parseInt(theme.text_col);
		lineColor = Std.parseInt(theme.line_col);
		nameTheme = theme.name_col;

		#if debug
		FlxG.log.add('Current Theme: $nameTheme');
		#end
	}
}
