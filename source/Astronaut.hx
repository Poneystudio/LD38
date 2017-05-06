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
class Astronaut extends FlxSprite 
{
	var rnd:FlxRandom;
	
	var some_speed:Float;
	var some_angle:Float;
	
	public function new() 
	{
		super();
		
		rnd = new FlxRandom();
		
		// graphcis
		this.loadGraphic(AssetPaths.astronaut__png, true, 64, 64);
		animation.add("floating", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 30, true);
		animation.play("floating");
		
		// physics ?
		this.moves = true;
		this.solid = true;
		this.elasticity = 1;
		this.mass = 1;
		
		// position
		this.x = rnd.int(Std.int(FlxG.width/2), FlxG.width - 64);
		this.y = rnd.int(64, FlxG.height - 64);

		// transition
		some_speed = 256;
		some_angle = 129;
		
		this.velocity.set(some_speed, 0);
		this.velocity.rotate(FlxPoint.weak(0, 0), some_angle);
		
		// funny rotation
		this.angularVelocity = rnd.int(0, 256);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}