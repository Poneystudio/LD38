package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

/**
 * ...
 * @author SoKette
 */
class ExplainState extends FlxState 
{
	var _sprite:FlxSprite;

	override public function create():Void
	{
		_sprite = new FlxSprite();
		_sprite.loadGraphic(AssetPaths.explain__png);
		add(_sprite);
		
		super.create();
	}
	
		override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyJustPressed([ESCAPE]))
		{
			FlxG.switchState(new MenuState());
		}
		if (FlxG.mouse.justPressed)
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update(elapsed);
	}
}