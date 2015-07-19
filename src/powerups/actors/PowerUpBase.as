package powerups.actors 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerUpBase extends AntActor 
	{
		
		public function PowerUpBase() 
		{
			super();
			
			moves = true;
			velocity.y = GameState.speed;
			y = -100;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (GameState.isPause) {
				moves = false;
				return;
			} else {
				moves = true;
			}
			
			velocity.y = GameState.speed;
			
			if (y > 680) {
				
				kill();
				return;
			}
			
			if (GameState.t != null) {
				if (bounds.intersectsRect(GameState.t.bounds)) {
					collide();
					
					// убиваем актера
					kill();
				}
			}
			
		}
		
		protected function collide():void {
			
		}
		
		
		
	}

}