package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class LockStrumNote extends FlxSprite
{
	private var colorSwap:ColorSwap;
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;

	private var player:Int;

	public function new(x:Float, y:Float, leData:Int, player:Int) {
		colorSwap = new ColorSwap();
		shader = colorSwap.shader;
		noteData = leData;
		this.player = player;
		this.noteData = leData;
		super(x, y);

		var skin:String = 'LOCKNOTE_assets';
		//if(PlayState.SONG.arrowSkin != null && PlayState.SONG.arrowSkin.length > 1 && player != 1) skin = PlayState.SONG.arrowSkin;

		frames = Paths.getSparrowAtlas(skin);
		//animation.addByPrefix('green', 'arrowUP');
		//animation.addByPrefix('blue', 'arrowDOWN');
		//animation.addByPrefix('purple', 'arrowLEFT');
		//animation.addByPrefix('red', 'arrowRIGHT');

		antialiasing = ClientPrefs.globalAntialiasing;
		setGraphicSize(Std.int(width * 0.7));

		switch (Math.abs(leData))
		{
			case 0:
				animation.addByIndices('static', 'left press lock', [14], null);
				animation.addByPrefix('pressed', 'left press lock', 24, false);
				animation.addByPrefix('confirm', 'left confirm', 24, false);
				animation.addByPrefix('release', 'left release', 24, false);
			case 1:
				animation.addByIndices('static', 'down press lock', [14], null);
				animation.addByPrefix('pressed', 'down press lock', 24, false);
				animation.addByPrefix('confirm', 'down confirm', 24, false);
				animation.addByPrefix('release', 'down release', 24, false);
			case 2:
				animation.addByIndices('static', 'up press lock', [14], null);
				animation.addByPrefix('pressed', 'up press lock', 24, false);
				animation.addByPrefix('confirm', 'up confirm', 24, false);
				animation.addByPrefix('release', 'up release', 24, false);
			case 3:
				animation.addByIndices('static', 'right press lock', [14], null);
				animation.addByPrefix('pressed', 'right press lock', 24, false);
				animation.addByPrefix('confirm', 'right confirm', 24, false);
				animation.addByPrefix('release', 'right release', 24, false);
		}

		updateHitbox();
		scrollFactor.set();
	}

	public function postAddedToGroup() {
		playAnim('static');
		x += Note.swagWidth * noteData;
		x += ((FlxG.width / 2) * player);
		
		y -= 40;
		x -= 13;

		if (noteData == 1 | 2 | 3)
		{
			x += 20;
		}

		ID = noteData;
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) {
				playAnim('static');
				resetAnim = 0;
			}
		}
		
		/*if(animation.curAnim.name == 'confirm' && !PlayState.isPixelStage) {
			updateConfirmOffset();
		}*/

		super.update(elapsed);
	}

	public function playAnim(anim:String, ?force:Bool = false) {
		animation.play(anim, force);
		centerOffsets();
		if(animation.curAnim == null || animation.curAnim.name == 'static') {
			colorSwap.hue = 0;
			colorSwap.saturation = 0;
			colorSwap.brightness = 0;
		} else {
			colorSwap.hue = ClientPrefs.arrowHSV[noteData % 4][0] / 360;
			colorSwap.saturation = ClientPrefs.arrowHSV[noteData % 4][1] / 100;
			colorSwap.brightness = ClientPrefs.arrowHSV[noteData % 4][2] / 100;

			/*if(animation.curAnim.name == 'confirm' && !PlayState.isPixelStage) {
				updateConfirmOffset();
			}*/
		}
	}

	function updateConfirmOffset() { //TO DO: Find a calc to make the offset work fine on other angles
		centerOffsets();
		offset.x -= 13;
		offset.y -= 13;
	}
}
