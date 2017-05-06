package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import openfl.Lib;

class MenuState extends FlxState
{
	var _sprite:FlxSprite;
	
	override public function create():Void
	{
		_sprite = new FlxSprite();
		_sprite.loadGraphic(AssetPaths.splashscreen__png);
		add(_sprite);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyJustPressed([ESCAPE]))
		{
			Lib.close();
		}
		if (FlxG.mouse.justPressed)
		{
			FlxG.switchState(new ExplainState());
		}
		
		super.update(elapsed);
	}
}