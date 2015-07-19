package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntCamera;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.Anthill;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.awards.AwardsState;
	import states.GameState;
	import states.MenuState;
	import states.CreditsState;
	import states.UpgradesState;

	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		private var st:Vector.<Class>;
		private var index:int = 0;

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
			//AntStatistic.debugMode = true;
			AntStatistic.loadData();
			//AntStatistic.clearData();
			AntStatistic.saveData();
			
			// rasterize graphics
			var assets:AssetLoader = new AssetLoader();
			assets.load(loadComplete);
			
			UserData.load();
		}
		
		private function loadComplete():void 
		{
			st = new <Class>[GameState, CreditsState, AwardsState, MenuState, UpgradesState];
			index = 3;
			
			var ant:Anthill = new Anthill(st[index], 100);
			addChild(ant);
			
			AntG.debugMode = true;
		}
		
		
		
		

	}

}