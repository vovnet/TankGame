package tanks 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class WheelProtection extends AntActor
	{
		
		
		public function WheelProtection() 
		{
			super();
			
			addAnimationFromCache("wheel_sled");
			moves = true;
			velocity.y = 200;
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
			}
		}
		
	}

}