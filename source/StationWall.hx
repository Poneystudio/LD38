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
class StationWall extends FlxSprite 
{
	var rnd:FlxRandom;
	
	var some_speed:Float;
	var some_angle:Float;

	public function new(x:Int, y:Int) 
	{
		super(x, y);
		
		rnd = new FlxRandom();
		
		// graphics
		this.loadGraphic(AssetPaths.stationwall__png, true, 32, 32);
		animation.add("0", [0], 0);
		animation.add("1", [1], 0);
		animation.add("2", [2], 0);
		animation.add("3", [3], 0);
		animation.add("4", [4], 0);
		animation.add("5", [5], 0);
		animation.add("6", [6], 0);
		animation.add("7", [7], 0);
		switch (rnd.int(0, 7))
		{
			case 0:
				animation.play("0");
			case 1:
				animation.play("1");
			case 2:
				animation.play("2");
			case 3:
				animation.play("3");
			case 4:
				animation.play("4");
			case 5:
				animation.play("5");
			case 6:
				animation.play("6");
			case 7:
				animation.play("7");
			default:
				this.makeGraphic(32, 32, FlxColor.RED);
		}
		
		this.immovable = true;
	}
	
		override public function update(elapsed:Float):Void
	{		
		
		super.update(elapsed);
	}
}