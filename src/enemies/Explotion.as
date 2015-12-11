package enemies {
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Explotion extends AntActor {
		
		public function Explotion() {
			super();
			addAnimationFromCache(AssetLoader.EXPLOTION);
			play();
			animationSpeed = 0.4;
			repeat = false;
			moves = true;
		}
		
		override public function update():void {
			super.update();
			velocity.y = GameState.speed;
			if (!isPlaying)
				kill();
		}
	
	}

}