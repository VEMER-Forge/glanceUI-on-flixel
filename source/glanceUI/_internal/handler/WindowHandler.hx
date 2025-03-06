package glanceUI._internal.handler;

// import haxe.macro.Context;

class WindowHandler {

	static public function checkScale(w:Int, h:Int) {
		if(w < 300 || h < 200){
			trace("НЕСООТВЕТСВУЕТ ОКНУ ГОВНА");
		}return 300; 200;

	}
}
