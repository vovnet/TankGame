package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import ru.antkarlov.anthill.AntG;
	import states.StateManager;
	import user.StatAward;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	[Frame(factoryClass = "Preloader")]
	[SWF(width = 450, height = 600)]
	public class Main extends Sprite {
		
		public static var stManager:StateManager;
		private var splash:SponsorSplash;
		
		public function Main() {
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			stage.align = StageAlign.TOP_LEFT;
			stage.showDefaultContextMenu = false;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// splash screen
			splash = new SponsorSplash();
			addChild(splash);
			splash.addEventListener(SponsorSplash.COMPLETE_SPLASH, onCompleteSplash);
		
		/*
		   StatAward.create();
		
		   // rasterize graphics
		   var assets:AssetLoader = new AssetLoader();
		   assets.load(loadComplete);
		
		   UserData.load();*/
		}
		
		private function onCompleteSplash(e:Event):void {
			removeChild(splash);
			
			StatAward.create();
		
		   // rasterize graphics
		   var assets:AssetLoader = new AssetLoader();
		   assets.load(loadComplete);
		
		   UserData.load();
		}
		
		private function loadComplete():void {
			stManager = new StateManager();
			addChild(stManager);
			
			// подгружаем звуки
			SoundLoader.load();
			
			AntG.sounds.play("melody", 1, null, true, 9999);
			
			AntG.debugMode = false;
			AntG.fixedElapsed = true;
			AntG.elapsed = 0.1;
			AntG.timeScale = 0.6;
		}
	
	}

}