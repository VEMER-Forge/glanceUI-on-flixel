package glanceUI._internal.theme;

import haxe.Json;
import flixel.FlxG;
import haxe.format.JsonParser;
import sys.FileSystem;
import flixel.util.FlxSave;



/*the main customize theme colors
and more for reading file*/
typedef ThemeFile = {
		var mainColor:String;
		var foreignColor:String;
		var lineColor:String;
		var textColor:String;
		var nameTheme:String;
}

class Config {

	public static var curThemeFile:ThemeFile;

	public static var listTheme:Array<String> = ['default', 'neo'];

	public static function init() {
		FlxG.save.bind('glanceUI', getSavePath());
		if(FlxG.save != null)
			if(FlxG.save.data.glanceCurTheme == null){
				trace("SAVE THEME IS NULL");
				trace(FlxG.save.data.glanceCurTheme);
				FlxG.save.data.glanceCurTheme = 'default';
				// FlxG.save.flush();
				FlxG.log.add("save theme:" + FlxG.save.data.glanceCurTheme);
			}
			else if(FlxG.save.data.glanceCurTheme != null){
				trace('SAVE THEME FOUND');
				loadFile(FlxG.save.data.glanceCurTheme);
			}

			trace("CurTheme is " + FlxG.save.data.glanceCurTheme);

	}

	public static function switchSave(){

	}

	public static function saveTheme(){
		var save:FlxSave = new FlxSave();
		save.bind('glanceUI', getSavePath());
		save.data.glanceCurTheme = curThemeFile.nameTheme;
		save.flush();
		trace("tipo save");
	}

	public static function extraSave():Void {

	}

	public static function loadFile(name:String = 'default') {
		// Path to the folder
		var folderPath:String = "assets/glanceUI/data/themes/";

		// Get the list of files in the folder
		var files:Array<String> = FileSystem.readDirectory(folderPath);

		// Print the list of files
		for (file in files)
		{
			 trace(file);
		}
	}

	@:access(flixel.util.FlxSave.validate)
	inline public static function getSavePath():String {
		final company:String = FlxG.stage.application.meta.get('company');
		return '${company}/${flixel.util.FlxSave.validate(FlxG.stage.application.meta.get('file'))}';
	}
}
