package glanceUI;

import openfl.ui.MouseCursor;

class Mouse {
	public static dynamic function changeCursor(cursor:MouseCursor)
		openfl.ui.Mouse.cursor = cursor;
}
