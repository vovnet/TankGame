package tanks 
{
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Bullet extends AntActor 
	{
		
		public function Bullet() 
		{
			super();
			
			addAnimationFromCache("bullet_mc");
			moves = true;
			y = -100;
			velocity.y = -800;
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
			
			if (y < 0) {
				kill();
				//trace("kill bullet");
			}
		}
		
		override public function kill():void 
		{
			GameState.bullet = null;
			super.kill();
			
		}
		
	}

}