package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntCamera;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.Anthill;
	import ru.antkarlov.anthill.AntSound;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.awards.AwardsState;
	import states.GameState;
	import states.MenuState;
	import states.CreditsState;
	import states.StateManager;
	import states.upgrade.UpgradesState;
	import user.StatAward;
	import user.UserData;

	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		
		public static var stManager:StateManager;

		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			stage.showDefaultContextMenu = false;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			StatAward.create();
			
			// rasterize graphics
			var assets:AssetLoader = new AssetLoader();
			assets.load(loadComplete);
			
			UserData.load();
		}
		
		private function loadComplete():void 
		{
			stManager = new StateManager();
			addChild(stManager);
			
			// подгружаем звуки
			SoundLoader.load();
			
			AntG.debugMode = true;
		}
		
		
		
		

	}

}