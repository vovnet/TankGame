package 
{
	import adobe.utils.CustomActions;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class WorldBackground extends AntActor 
	{
		private var bg1:AntActor;
		private var bg2:AntActor;
		
		private var isLoad:Boolean = false;
		
		public function WorldBackground() 
		{
			super();
			
			var loader:AntAssetLoader = new AntAssetLoader();
			loader.addClip(bg_back_mc);
			loader.eventComplete.add(onCompleteLoad);
			loader.start();
			
		}
		
		private function onCompleteLoad(loader:AntAssetLoader):void 
		{
			loader.destroy();
			
			bg1 = new AntActor();
			bg1.addAnimationFromCache("bg_back_mc");
			
			bg2 = new AntActor();
			bg2.addAnimationFromCache("bg_back_mc");
			
			
			bg1.y = -bg2.height;
			bg2.y = 0;
			
			add(bg1);
			add(bg2);
			
			isLoad = true;
			
			moves = true;
			velocity.y = 200;
		}
		
		override public function update():void 
		{
			super.update();
			if (GameState.isPause) {
				moves = false;
			} else {
				moves = true;
			}
			if (!isLoad) return;
			if (y >= bg1.height) {
				y = 0;
			}
		}
		
	}

}