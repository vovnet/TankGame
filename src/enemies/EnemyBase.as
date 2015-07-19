package enemies 
{
	import enemies.behaviors.IBehavior;
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class EnemyBase extends AntActor 
	{
		protected var behavior:IBehavior;
		
		public function EnemyBase() 
		{
			super();
			
			moves = true;
			velocity.y = GameState.speed;
			y = -100;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (y > 680) {
				kill();
				return;
			}
			
			if (GameState.isPause) {
				moves = false;
				return;
			} else {
				moves = true;
			}
			behavior.update();
		}
		
	}

}