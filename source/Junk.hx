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
class Junk extends FlxSprite 
{
	var rnd:FlxRandom;
	
	var some_speed:Float;
	var some_angle:Float;

	public function new(i:Int) 
	{
		super();
		
		rnd = new FlxRandom();
		
		// graphics
		this.loadGraphic(AssetPaths.junk__png, true, 32, 32);
		animation.add("pot", [0], 0);
		animation.add("tool", [1], 0);
		animation.add("screwdriver", [2], 0);
		animation.add("screen", [3], 0);
		switch (rnd.int(0, 3))
		{
			case 0:
				animation.play("pot");
			case 1:
				animation.play("tool");
			case 2:
				animation.play("screwdriver");
			case 3:
				animation.play("screen");
			default:
				this.makeGraphic(16, 16, FlxColor.RED);
		}
		
		//physics
		this.moves = true;
		this.solid = true;
		this.elasticity = 1;
		this.mass = 0.3;
		
		// position
		this.x = rnd.int(64, FlxG.width - 64);
		this.y = rnd.int(64, FlxG.height - 64);

		// transition
		some_speed = rnd.int(0, 128);
		some_angle = rnd.int(0, 360);
		
		this.velocity.set(some_speed, 0);
		this.velocity.rotate(FlxPoint.weak(0, 0), some_angle);
		
		// funny rotation
		this.angularVelocity = rnd.int(0,256);
	}
	
		override public function update(elapsed:Float):Void
	{		
		
		super.update(elapsed);
	}
}