package;

import flixel.addons.ui.FlxInputText;
import flixel.FlxG;
import flixel.FlxState;
import sys.FileSystem;
import flixel.FlxSprite;

import glanceUI.*;
import glanceUI.taskBar.TaskBar;
import glanceUI._internal.Loader;

import glanceUI.notification.Notification;



class PlayState extends FlxState {
	var window:Window;
	var bar:TaskBar;

	var input:FlxInputText;
	var task:Notification;

	override public function create() {

		glanceUI.Glance.init();

		FlxG.camera.bgColor = 0xFF000000;

		var bg:FlxSprite = new FlxSprite(0, -60).loadGraphic(Loader.img('Puppy Minus BF-by CAFuture', 'jpg'));
		bg.scale.set(0.76, 0.76);
		bg.updateHitbox();
		bg.antialiasing = true;
		add(bg);

		// FlxG.camera.pixelPerfectRender = true;

		// bar = new TaskBar(true, 'lol');
		// add(bar);

		window = new Window(10, 40, 800, 500, 'ОКНО - 1');
		add(window);

		input = new FlxInputText(window.x + 20, window.y + 20, 200, "Text Box", 12, 0xFF000000, 0xFF0EB16F);
		window.content.add(input);


		var huj:TaskBar = new TaskBar(true);
		add(huj);

		task = new Notification(30, 40);
		add(task);

		super.create();
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.justPressed.R) window.revive();
		if (FlxG.keys.justPressed.T) task.show("none", "hgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi\nhgfuisngiuengiuensgiue\nniugneiugneiugnvi");
		if (FlxG.keys.justPressed.E) task.show("error");
		if (FlxG.keys.justPressed.S) task.show("success");
		if (FlxG.keys.justPressed.I) task.show("info");
		if (FlxG.keys.justPressed.W) task.show("warning");
		if (FlxG.keys.justPressed.Q) Config.switchSave("neo");
		if (FlxG.keys.justPressed.Y) Config.switchSave("default");
		super.update(elapsed);
	}
}
