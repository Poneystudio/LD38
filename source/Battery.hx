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
class Battery extends FlxSprite 
{
	var rnd:FlxRandom;
	
	var some_speed:Float;
	var some_angle:Float;
	
	public function new() 
	{
		super();
		
		rnd = new FlxRandom();
		
		// graphcis
		this.loadGraphic(AssetPaths.battery__png, true, 32, 32);
		animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7], 10, true);
		animation.play("idle");
		
		// physics ?
		this.moves = true;
		this.solid = true;
		this.elasticity = 1;
		this.mass = 16;
		
		// position
		this.x = rnd.int(64, Std.int(FlxG.width/2));
		this.y = rnd.int(64, FlxG.height - 64);
		
		// funny rotation
		this.angularVelocity = rnd.int(0, 64);
	}
	
		override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}