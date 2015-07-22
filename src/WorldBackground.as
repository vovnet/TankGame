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
		private var bg1:AntActor = new AntActor();
		private var bg2:AntActor = new AntActor();
		
		public function WorldBackground() 
		{
			super();
			
			bg1.addAnimationFromCache("background_summer");
			bg2.addAnimationFromCache("background_summer");
			
			bg1.y = -bg2.height;
			bg2.y = 0;
			
			add(bg1);
			add(bg2);
			
			moves = true;
			velocity.y = GameState.speed;
		}
		
		
		override public function update():void 
		{
			super.update();
			if (GameState.isPause) {
				moves = false;
			} else {
				moves = true;
			}
			
			if (velocity.y != GameState.speed) velocity.y = GameState.speed;
			
			if (y >= bg1.height) {
				y = 0;
			}
		}
		
	}

}