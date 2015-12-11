package instructions {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class GameInstructor extends AntActor {
		
		private var isShowControl:Boolean = false;
		private var isShowShot:Boolean = false;
		private var isShowRestart:Boolean = false;
		
		private var controlActor:AntActor;
		private var shotActor:AntActor;
		private var restartActor:AntActor;
		
		private var layer:AntEntity;
		
		public function GameInstructor():void {
			controlActor = new AntActor();
			controlActor.addAnimationFromCache(AssetLoader.INSTRUCT_CONTROL);
			
			shotActor = new AntActor();
			shotActor.addAnimationFromCache(AssetLoader.INSTRUCT_SHOT);
			
			restartActor = new AntActor();
			restartActor.addAnimationFromCache(AssetLoader.INSTRUCT_RESTART);
			
		}
		
		override public function update():void {
			super.update();
			
			if (AntStatistic.awardIsEarned("driver")) {
				kill();
				return;
			}
			
			layer = GameState.instance.mainLayer;
			if (GameState.instance.countBlockPosts == 0 && !isShowControl) {
				isShowControl = true;
				layer.add(controlActor);
				controlActor.reset(84, -160);
				controlActor.z = 3;
				controlActor.moves = true;
				controlActor.velocity.y = GameState.speed;
				layer.sort("z");
			}
			
			if (GameState.instance.countBlockPosts == 4 && !isShowShot) {
				isShowShot = true;
				layer.add(shotActor);
				shotActor.reset(84, 0);
				shotActor.z = 3;
				shotActor.moves = true;
				shotActor.velocity.y = GameState.speed;
				layer.sort("z");
			}
			
			if (GameState.instance.countBlockPosts == 8 && !isShowRestart) {
				isShowRestart = true;
				layer.add(restartActor);
				restartActor.reset(90, 0);
				restartActor.z = 3;
				restartActor.moves = true;
				restartActor.velocity.y = GameState.speed;
				layer.sort("z");
			}
			
			
		}
	}

}