package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_glanceui_fonts_pixeloidmono_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy48:assets%2FglanceUI%2Fdata%2Fthemes%2Fdefault.jsony4:sizei143y4:typey4:TEXTy2:idR1y7:preloadtgoR0y44:assets%2FglanceUI%2Fdata%2Fthemes%2Fneo.jsonR2i139R3R4R5R7R6tgoR0y39:assets%2FglanceUI%2Fdata%2Fversion.dataR2i16R3R4R5R8R6tgoR2i111312R3y4:FONTy9:classNamey47:__ASSET__assets_glanceui_fonts_pixeloidmono_ttfR5y44:assets%2FglanceUI%2Ffonts%2FPixeloidMono.ttfR6tgoR0y46:assets%2FglanceUI%2Fimg%2Fbuttons%2Fbutton.pngR2i266R3y5:IMAGER5R13R6tgoR0y52:assets%2FglanceUI%2Fimg%2Fbuttons%2FbuttonScroll.pngR2i329R3R14R5R15R6tgoR0y48:assets%2FglanceUI%2Fimg%2Fbuttons%2Fcheckbox.pngR2i300R3R14R5R16R6tgoR0y45:assets%2FglanceUI%2Fimg%2Fbuttons%2Fclose.pngR2i299R3R14R5R17R6tgoR0y44:assets%2FglanceUI%2Fimg%2Fbuttons%2Fhide.pngR2i192R3R14R5R18R6tgoR0y55:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fcenter.pngR2i155R3R14R5R19R6tgoR0y53:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fleft.pngR2i188R3R14R5R20R6tgoR0y54:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fright.pngR2i187R3R14R5R21R6tgoR0y66:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fselected%2Fcenter.pngR2i153R3R14R5R22R6tgoR0y64:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fselected%2Fleft.pngR2i189R3R14R5R23R6tgoR0y65:assets%2FglanceUI%2Fimg%2Fbuttons%2Fscroll%2Fselected%2Fright.pngR2i193R3R14R5R24R6tgoR0y40:assets%2FglanceUI%2Fimg%2FglanceLogo.pngR2i612R3R14R5R25R6tgoR0y45:assets%2FglanceUI%2Fimg%2Fwindow%2Fcenter.pngR2i147R3R14R5R26R6tgoR0y50:assets%2FglanceUI%2Fimg%2Fwindow%2FleftDownWin.pngR2i160R3R14R5R27R6tgoR0y48:assets%2FglanceUI%2Fimg%2Fwindow%2FleftUpWin.pngR2i162R3R14R5R28R6tgoR0y51:assets%2FglanceUI%2Fimg%2Fwindow%2FrightDownWin.pngR2i156R3R14R5R29R6tgoR0y49:assets%2FglanceUI%2Fimg%2Fwindow%2FrightUpWin.pngR2i158R3R14R5R30R6tgoR2i102798R3y5:SOUNDR5y35:assets%2FglanceUI%2Fsnd%2Fclick.wavy9:pathGroupaR32hR6tgoR2i102798R3R31R5y40:assets%2FglanceUI%2Fsnd%2FclickClose.wavR33aR34hR6tgoR2i8220R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R33aR36y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R35R5y28:flixel%2Fsounds%2Fflixel.mp3R33aR38y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3R31R5R37R33aR36R37hgoR2i33629R3R31R5R39R33aR38R39hgoR2i15744R3R9R10y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R9R10y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R14R5R44R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R14R5R45R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR2i299R3R14R5R46R6tgoR0y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR2i730R3R14R5R47R6tgoR0y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR2i236R3R14R5R48R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR2i209R3R14R5R49R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i75R3R14R5R50R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i211R3R14R5R51R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i216R3R14R5R52R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i222R3R14R5R53R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i238R3R14R5R54R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i227R3R14R5R55R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i118R3R14R5R56R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i254R3R14R5R57R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i101R3R14R5R58R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i97R3R14R5R59R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i135R3R14R5R60R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i124R3R14R5R61R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i102R3R14R5R62R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i118R3R14R5R63R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i86R3R14R5R64R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1337R3R14R5R65R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i157R3R14R5R66R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i74R3R14R5R67R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i72R3R14R5R68R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i77R3R14R5R69R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i83R3R14R5R70R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i108R3R14R5R71R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i81R3R14R5R72R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i94R3R14R5R73R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i106R3R14R5R74R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i111R3R14R5R75R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i176R3R14R5R76R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R77R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R78R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R79R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_themes_default_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_themes_neo_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_version_data extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_fonts_pixeloidmono_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_buttonscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_close_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_hide_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_center_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_center_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_glancelogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_center_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_leftdownwin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_leftupwin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_rightdownwin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_rightupwin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_snd_click_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_glanceui_snd_clickclose_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/glanceUI/data/themes/default.json") @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_themes_default_json extends haxe.io.Bytes {}
@:keep @:file("assets/glanceUI/data/themes/neo.json") @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_themes_neo_json extends haxe.io.Bytes {}
@:keep @:file("assets/glanceUI/data/version.data") @:noCompletion #if display private #end class __ASSET__assets_glanceui_data_version_data extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/PixeloidMono.ttf") @:noCompletion #if display private #end class __ASSET__assets_glanceui_fonts_pixeloidmono_ttf extends lime.text.Font {}
@:keep @:image("assets/glanceUI/img/buttons/button.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_button_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/buttonScroll.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_buttonscroll_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/checkbox.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_checkbox_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/close.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_close_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/hide.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_hide_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/center.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_center_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/left.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_left_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/right.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_right_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/selected/center.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_center_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/selected/left.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_left_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/buttons/scroll/selected/right.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_buttons_scroll_selected_right_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/glanceLogo.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_glancelogo_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/window/center.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_center_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/window/leftDownWin.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_leftdownwin_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/window/leftUpWin.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_leftupwin_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/window/rightDownWin.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_rightdownwin_png extends lime.graphics.Image {}
@:keep @:image("assets/glanceUI/img/window/rightUpWin.png") @:noCompletion #if display private #end class __ASSET__assets_glanceui_img_window_rightupwin_png extends lime.graphics.Image {}
@:keep @:file("assets/glanceUI/snd/click.wav") @:noCompletion #if display private #end class __ASSET__assets_glanceui_snd_click_wav extends haxe.io.Bytes {}
@:keep @:file("assets/glanceUI/snd/clickClose.wav") @:noCompletion #if display private #end class __ASSET__assets_glanceui_snd_clickclose_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,0,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,6,4/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_glanceui_fonts_pixeloidmono_ttf') @:noCompletion #if display private #end class __ASSET__assets_glanceui_fonts_pixeloidmono_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/glanceUI/fonts/PixeloidMono"; #else ascender = 1836; descender = -408; height = 2268; numGlyphs = 1103; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 1836; #end name = "Pixeloid Mono"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_glanceui_fonts_pixeloidmono_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_glanceui_fonts_pixeloidmono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_glanceui_fonts_pixeloidmono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_glanceui_fonts_pixeloidmono_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_glanceui_fonts_pixeloidmono_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_glanceui_fonts_pixeloidmono_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end