package glanceUI._internal.handler;

// import haxe.macro.Context;

class WindowHandler {

	static public function checkScale(w:Int, h:Int) {
		if(w < 300 || h < 200){
			trace("НЕСООТВЕТСВУЕТ ОКНУ ГОВНА");
		}return 300; 200;

	}

	public static var width:Int = 300;
	public static var height:Int = 200;
	public static var cordinates<Array>
}
