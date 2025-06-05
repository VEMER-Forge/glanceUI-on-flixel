package glanceUI._internal.theme;

import haxe.Exception;
import haxe.Json;
import flixel.FlxG;
import haxe.format.JsonParser;
import sys.FileSystem;
import flixel.util.FlxSave;

class Config {

	// much better thana commit before -- mr_chaoss

	public static var curTheme(default, null):ThemeType;
	private static var folderPath:String = "themes/";
	private static var default_Theme = "default";

	public static function init() {
		FlxG.save.bind('glanceUI', getSavePath());

		try {
			if (FlxG.save.data.glanceCurTheme == null) {
				#if debug
				FlxG.log.add("No Theme Found");
				#end
				FlxG.save.data.glanceCurTheme = default_Theme;
				FlxG.save.flush();
			}
			loadFile(FlxG.save.data.glanceCurTheme);

		}
		catch(e){
			FlxG.log.error(e);
			loadDefault();
		}

	}

	public static function switchSave(themeName:String) {
		try {
			if(loadFile(themeName)){
				saveTheme();
				return true;
			}
			return false;
		} catch(e) {
			FlxG.log.error('Failed to switch: ${e.message}');
			return false;
		}
	}

	public static function extraSave():Void {

	}

	public static function loadFile(themeName:String):Bool {

		var themePath = Loader.file(folderPath + themeName, 'json');

// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠛⠉⠙⠛⠛⠛⠛⠻⢿⣿⣷⣤⡀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠋⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠈⢻⣿⣿⡄⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⣸⣿⡏⠀⠀⠀⣠⣶⣾⣿⣿⣿⠿⠿⠿⢿⣿⣿⣿⣄⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀⢰⣿⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣷⡄⠀
// ⠀⠀⣀⣤⣴⣶⣶⣿⡟⠀⠀⠀⢸⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⠀
// ⠀⢰⣿⡟⠋⠉⣹⣿⡇⠀⠀⠀⠘⣿⣿⣿⣿⣷⣦⣤⣤⣤⣶⣶⣶⣶⣿⣿⣿⠀
// ⠀⢸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀
// ⠀⣸⣿⡇⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠉⠻⠿⣿⣿⣿⣿⡿⠿⠿⠛⢻⣿⡇⠀⠀
// ⠀⣿⣿⠁⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⠀⠀
// ⠀⣿⣿⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀
// ⠀⣿⣿⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀
// ⠀⢿⣿⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀
// ⠀⠸⣿⣧⡀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠃⠀⠀
// ⠀⠀⠛⢿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⣰⣿⣿⣷⣶⣶⣶⣶⠶⠀⢠⣿⣿⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⣽⣿⡏⠁⠀⠀⢸⣿⡇⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣿⣿⡇⠀⢹⣿⡆⠀⠀⠀⣸⣿⠇⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⢿⣿⣦⣄⣀⣠⣴⣿⣿⠁⠀⠈⠻⣿⣿⣿⣿⡿⠏⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⠿⠿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// if(!FileSustem.exists(themePath)){
// 	trace("fuck you bitchass"); -- я умній пизда
// }

		if(!FileSystem.exists(themePath)){
			#if debug
			FlxG.log.warn('Theme $themeName is not exists, using default..');
			#end
			loadDefault();
			return false;
		}

		try {
			var jsonData = File.getContent(themePath);
			curTheme = Json.parse(jsonData);

			if(!isValidTheme(curTheme)) {
				throw new Exception('Invalid theme format $themeName');
			}

			Theme.applyTheme(curTheme);
			return true;
		} catch(e){
			#if debug
			FlxG.log.error(e);
			#end
			loadDefault();
			return false;
		}


	}

	private static function saveTheme():Void {
		if (curTheme == null) return;

		try {
			FlxG.save.data.glanceCurTheme = curTheme.name_col;
			FlxG.save.flush();
			FlxG.log.add('Saved theme: ${curTheme.name_col}');
		} catch (e) {
			FlxG.log.error('Failed to save theme: ${curTheme.name_col}');
		}
	}

	private static function isValidTheme(theme:ThemeType):Bool {
		return theme != null
		&& Reflect.hasField(theme, "main_col")
		&& Reflect.hasField(theme, "foreign_col")
		&& Reflect.hasField(theme, "text_col")
		&& Reflect.hasField(theme, "line_col")
		&& theme.name_col != null;
	}

	private static function loadDefault():Void {
		curTheme = {
			name_col: default_Theme,
			main_col: "0xFFFF00F2",
			foreign_col: "0xFFB40078",
			text_col: "0xFFFFFFFF",
			line_col: "0xFF6F00FF"
		}
		return Theme.applyTheme(curTheme);
	}

	@:access(flixel.util.FlxSave.validate)
	inline public static function getSavePath():String {
		final company:String = FlxG.stage.application.meta.get('company');
		return '${company}/${flixel.util.FlxSave.validate(FlxG.stage.application.meta.get('file'))}';
	}
}
