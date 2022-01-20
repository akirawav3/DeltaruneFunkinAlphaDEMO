package delta;

import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DeltaBox extends FlxSpriteGroup
{
	var txtSpeed:Float = 0.05;
	var animBG:FlxSprite;
	var specialBG:FlxSprite;
	var canInput:Bool = true;
	var stopSound:Bool = false;
	var funnySound:FlxSound;

	var box:FlxSprite;

	var curCharacter:String = '';
	var dialogueList:Array<String> = [];

	var swagDialogue:DeltaTypeText;

	public var finishThing:Void->Void;

	public function new(dialogueList:Array<String>)
	{
		super();

		DeltaPlayState.paused = true;

		this.dialogueList = dialogueList;
		
		box = new FlxSprite();
		box.updateHitbox();
		box.antialiasing = ClientPrefs.globalAntialiasing;
		box.scale.set(.8, .8);
		box.y = FlxG.height - 295;
		add(box);

		swagDialogue = new DeltaTypeText(445, 485, Std.int(FlxG.width * 0.5), "", 42);
		swagDialogue.font = Paths.font("fixedsys.ttf");
		swagDialogue.color = FlxColor.WHITE;
		swagDialogue.antialiasing = ClientPrefs.globalAntialiasing;
		add(swagDialogue);

		startDialogue();
	}

	override function update(elapsed:Float)
	{
		if (PlayerSettings.player1.controls.ACCEPT && canInput)
		{
			addDialogue();
		}

		//trace(animBG.frame);
		
		super.update(elapsed);
	}

	function addDialogue()
		{	
				if (dialogueList[1] == null && dialogueList[0] != null)
					{
						if (!isEnding)
						{
							endIt();
						}
					}
				else
					{
						dialogueList.remove(dialogueList[0]);
						startDialogue();
					}
		}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();

		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(txtSpeed, true);

		//this switch statement may be abuse but i dont have any better ideas
		switch (curCharacter)
		{
			case 'empty':
				swagDialogue.sounds = Paths.sound('delta/text', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/empty', 'shared'));
				box.screenCenter(X);
			case 'alphys':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al', 'shared'));
				box.screenCenter(X);
			case 'al-nerv':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-nerv', 'shared'));
				box.screenCenter(X);
			case 'al-what':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-what', 'shared'));
				box.screenCenter(X);
			case 'al-worried':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-worried', 'shared'));
				box.screenCenter(X);
			case 'al-force':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-worried', 'shared'));
				box.screenCenter(X);

				new FlxTimer().start(1, function(tmr:FlxTimer) 
					{
						addDialogue();
					});
			case 'al-sweatsmile':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-sweatsmile', 'shared'));
				box.screenCenter(X);
			case 'al-smile':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = .8;
				box.loadGraphic(Paths.image('delta/dialogue/al-smile', 'shared'));
				box.screenCenter(X);
			case 'al-nervsmile':
				swagDialogue.sounds = Paths.sound('delta/dialogue/alphys', 'shared');
				swagDialogue.volume = 1;
				box.loadGraphic(Paths.image('delta/dialogue/al-nervsmile', 'shared'));
				box.screenCenter(X);

			case 'susie':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sus', 'shared'));
				box.screenCenter(X);
			case 'sus-smile':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sus-smile', 'shared'));
				box.screenCenter(X);
			case 'sussy':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sussy', 'shared'));
				box.screenCenter(X);
			case 'sus-smirk':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sus-smirk', 'shared'));
				box.screenCenter(X);
			case 'sus-smirk2':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sus-smirk2', 'shared'));
				box.screenCenter(X);
			case 'sussy-smile':
				swagDialogue.sounds = Paths.sound('delta/dialogue/susie', 'shared');
				swagDialogue.volume = .5;
				box.loadGraphic(Paths.image('delta/dialogue/sussy-smile', 'shared'));
				box.screenCenter(X);

			case 'noe':
				swagDialogue.sounds = Paths.sound('delta/dialogue/noelle', 'shared');
				swagDialogue.volume = .3;
				box.loadGraphic(Paths.image('delta/dialogue/noelle', 'shared'));
				box.screenCenter(X);
			case 'noe-flust':
				swagDialogue.sounds = Paths.sound('delta/dialogue/noelle', 'shared');
				swagDialogue.volume = .3;
				box.loadGraphic(Paths.image('delta/dialogue/noelle-flust', 'shared'));
				box.screenCenter(X);
			case 'noe-sad':
				swagDialogue.sounds = Paths.sound('delta/dialogue/noelle', 'shared');
				swagDialogue.volume = .3;
				box.loadGraphic(Paths.image('delta/dialogue/noelle-sad', 'shared'));
				box.screenCenter(X);
			case 'noe-force':
				swagDialogue.sounds = Paths.sound('delta/dialogue/noelle', 'shared');
				swagDialogue.volume = .3;
				box.loadGraphic(Paths.image('delta/dialogue/noelle-flust', 'shared'));
				box.screenCenter(X);

				new FlxTimer().start(1, function(tmr:FlxTimer) 
					{
						addDialogue();
					});
			//OTHER DIALOGUE MECHANICS

			//input control
			case 'stopInputs':
				canInput = false;
				addDialogue();
			case 'startInputs':
				canInput = true;
				addDialogue();

			//hiding stuff
			case 'hideBox':
				box.visible = false;
				swagDialogue.visible = false;
				addDialogue();
			case 'showBox':
				box.visible = true;
				swagDialogue.visible = true;
				addDialogue();
			
			//text shit
			case 'setTxtSpeed':
				swagDialogue.volume = 0;
				txtSpeed = Std.parseFloat(dialogueList[0]);
				addDialogue();
			case 'setTextSize':
				swagDialogue.volume = 0;
				swagDialogue.size = Std.parseInt(dialogueList[0]);
				addDialogue();
			case 'setTextX':
				swagDialogue.volume = 0;
				swagDialogue.x += Std.parseInt(dialogueList[0]);
				addDialogue();
			case 'setTextY':
				swagDialogue.volume = 0;
				swagDialogue.y += Std.parseInt(dialogueList[0]);
				addDialogue();
			
			//music control
			case 'playMusic':
				swagDialogue.volume = 0;
				FlxG.sound.playMusic(Paths.music(dialogueList[0], 'shared'), .3);
				addDialogue();
			case 'pauseMusic':
				FlxG.sound.music.pause();
				addDialogue();
			case 'resumeMusic':
				FlxG.sound.music.resume();
				addDialogue();

			case 'camFade':
				var splitThing:Array<String> = dialogueList[0].split(",");
				DeltaPlayState.dialogueCam.fade(FlxColor.fromString(splitThing[0]), Std.parseFloat(splitThing[1]), true, function(){
					addDialogue();
				});
			case 'camShake':
				var splitThing:Array<String> = dialogueList[0].split(",");
				DeltaPlayState.dialogueCam.shake(FlxColor.fromString(splitThing[0]), Std.parseFloat(splitThing[1]));
				addDialogue();
				
			//sound control
			case 'playSound':
				swagDialogue.volume = 0;
				funnySound = new FlxSound().loadEmbedded(Paths.sound(dialogueList[0], 'shared'));
				funnySound.play(true);
				//FlxG.sound.play(Paths.sound(dialogueList[0], 'shared'));
				addDialogue();
			case 'stopSound':
				funnySound.stop();
				addDialogue();

			//timing and stuff
			case 'timer':
				swagDialogue.volume = 0;
				new FlxTimer().start(Std.parseFloat(dialogueList[0]), function(tmr:FlxTimer) 
				{
					addDialogue();
				});
			case 'buffer':
				//do nothing wait for an input
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}

	function endIt()
		{
			isEnding = true;
			kill();
			new FlxTimer().start(.25, function(tmr:FlxTimer) 
				{
					DeltaPlayState.paused = false;
				});
		}
}