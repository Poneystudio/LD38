package;

import Std;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	var rnd:FlxRandom;
	
	var _sprBackground:FlxSprite;
	var _sprStation:FlxSprite;
	var _sprObjective:Objective;
	var _border:FlxSprite;
	var _junk:FlxSprite;
	var _battery:Battery;
	var _idiot:Astronaut;
	var _victory:FlxText;
	
	var TILE_WIDTH:Int = 32;
	var TILE_HEIGHT:Int = 32;
	
	var WIDTH_IN_TILES:Int;
	var HEIGHT_IN_TILES:Int;
	
	var _sndDing1:FlxSound;
	var _sndDing2:FlxSound;
	var _sndHumpf01:FlxSound;
	var _sndHumpf02:FlxSound;
	var _sndHumpf03:FlxSound;
	var _sndHumpf04:FlxSound;
	var _sndHumpf05:FlxSound;
	var _sndHumpf06:FlxSound;
	var _sndHumpf07:FlxSound;
	var _sndHumpf08:FlxSound;
	var _sndHumpf09:FlxSound;
	var _sndHumpf10:FlxSound;
	
	var _sndVictory:FlxSound;
	
	override public function create():Void
	{
		super.create();
		
		rnd = new FlxRandom();
	
		WIDTH_IN_TILES = Std.int(FlxG.width / TILE_WIDTH);
		HEIGHT_IN_TILES = Std.int(FlxG.height / TILE_HEIGHT);
		trace(WIDTH_IN_TILES);
		trace(HEIGHT_IN_TILES);
		
		_sprBackground = new FlxSprite(0, 0);
		_sprBackground.loadGraphic(AssetPaths.background__png);
		_sprBackground.solid = false;
		_sprBackground.angularVelocity = 23;
		add(_sprBackground);
		
		_sprStation = new FlxSprite(0, 0);
		_sprStation.loadGraphic(AssetPaths.stationback__png);
		add(_sprStation);
		
		_sprObjective = new Objective();
		add(_sprObjective);
		
		for (ty in 0...HEIGHT_IN_TILES + 1)
		{
			for (tx in 0...WIDTH_IN_TILES + 1)
			{
				if ((ty == 0) ||
					(tx == 0) ||
					(ty == HEIGHT_IN_TILES) ||
					(tx == WIDTH_IN_TILES))
				{
					_border = new StationWall(tx * TILE_WIDTH - Std.int(TILE_WIDTH / 2),
											ty * TILE_HEIGHT);
					add(_border);
				}
			}
		}
		
		for (i in 0...6)
		{
			_junk = new Junk(i);
			add(_junk);
		}
		
		_battery = new Battery();
		add(_battery);
		
		_idiot = new Astronaut();
		add(_idiot);
		
		_victory = new FlxText(FlxG.width - 64, FlxG.height - 64);
		_victory.text = "Yeah ! You restored the power ! You're not going to die !";
		_victory.size = 18;
		_victory.color = FlxColor.CYAN;
		_victory.screenCenter();
		_victory.visible = false;
		add(_victory);
		
		_sndDing1 = FlxG.sound.load(AssetPaths.percut1__ogg, 1, false);
		_sndDing2 = FlxG.sound.load(AssetPaths.percut2__ogg, 1, false);
		_sndHumpf01 = FlxG.sound.load(AssetPaths.humpf01__ogg, 1, false);
		_sndHumpf02 = FlxG.sound.load(AssetPaths.humpf02__ogg, 1, false);
		_sndHumpf03 = FlxG.sound.load(AssetPaths.humpf03__ogg, 1, false);
		_sndHumpf04 = FlxG.sound.load(AssetPaths.humpf04__ogg, 1, false);
		_sndHumpf05 = FlxG.sound.load(AssetPaths.humpf05__ogg, 1, false);
		_sndHumpf06 = FlxG.sound.load(AssetPaths.humpf06__ogg, 1, false);
		_sndHumpf07 = FlxG.sound.load(AssetPaths.humpf07__ogg, 1, false);
		_sndHumpf08 = FlxG.sound.load(AssetPaths.humpf08__ogg, 1, false);
		_sndHumpf09 = FlxG.sound.load(AssetPaths.humpf09__ogg, 1, false);
		_sndHumpf10 = FlxG.sound.load(AssetPaths.humpf10__ogg, 1, false);
		
		_sndVictory = FlxG.sound.load(AssetPaths.victory__ogg, 1, false);
	}

	private function control():Void
	{
		if (FlxG.mouse.justPressed)
		{
			var effect:Float = 0.25;
			var new_velocity_x:Float = _idiot.velocity.x - effect * (_idiot.x - FlxG.mouse.x);
			var new_velocity_y:Float = _idiot.velocity.y - effect * (_idiot.y - FlxG.mouse.y);
			_idiot.velocity.set(new_velocity_x, new_velocity_y);
		}
		
		if (FlxG.keys.anyJustPressed([ESCAPE]))
		{
			FlxG.switchState(new MenuState());
		}
		if (FlxG.keys.anyJustPressed([R]))
		{
			FlxG.resetState();
		}
	}
	
	override public function update(elapsed:Float):Void
	{	
		FlxG.collide();
		
		control();
		
		if (_battery.overlaps(_sprObjective))
		{
			_sprObjective.toggle_load();
			_battery.kill();
			_sprBackground.angularVelocity = 0;
			_victory.visible = true;
			_sndVictory.play();
		}
		
		//if (_idiot.overlapsAt(_junk.x + 1, _junk.y + 0, _junk) ||
			//_idiot.overlapsAt(_junk.x - 1, _junk.y + 0, _junk) ||
			//_idiot.overlapsAt(_junk.x + 0, _junk.y + 1, _junk) ||
			//_idiot.overlapsAt(_junk.x + 0, _junk.y - 1, _junk))
		//{
			//switch (rnd.int(1, 2))
			//{
				//case 1:
					//_sndHumpf01.play();
				//case 2:
					//_sndHumpf02.play();
				//case 3:
					//_sndHumpf03.play();
				//case 4:
					//_sndHumpf04.play();
				//case 5:
					//_sndHumpf05.play();
				//case 6:
					//_sndHumpf06.play();
				//case 7:
					//_sndHumpf07.play();
				//case 8:
					//_sndHumpf08.play();
				//case 9:
					//_sndHumpf09.play();
				//case 10:
					//_sndHumpf10.play();
			//}
		//}
		
		super.update(elapsed);
	}
}