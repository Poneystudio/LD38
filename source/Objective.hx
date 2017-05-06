package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author SoKette
 */
class Objective extends FlxSprite 
{
	var rnd:FlxRandom;
	var loaded:Bool;
	
	public function new() 
	{
		super();
		
		rnd = new FlxRandom();
		
		// graphcis
		this.loadGraphic(AssetPaths.objective__png, true, 64, 64);
		animation.add("idle", [0, 1, 2, 0, 0, 0, 0, 0, 3, 4, 0], 10, true);
		animation.add("loaded", [8, 9, 10, 11, 12, 13, 14, 15], 10, true);
		animation.play("idle");
		
		// physics ?
		this.solid = false;
		
		// position
		this.x = rnd.int(Std.int(FlxG.width*0.75), FlxG.width - 128);
		this.y = rnd.int(64, FlxG.height - 128);
		
		loaded = false;
	}
	
	public function toggle_load():Void
	{
		loaded = true;
	}
	
		override public function update(elapsed:Float):Void
	{
		if (loaded)
		{
			animation.play("loaded");
		}
		else
		{
			animation.play("idle");
		}
		
		super.update(elapsed);
	}
}