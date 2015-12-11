package bonus 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class BonusBase extends AntActor 
	{
		protected var sound:String = "addBonus";
		
		public function BonusBase() 
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
					AntG.sounds.play(sound);
					kill();
					behavior();
				}
			}
		}
		
		// необходимо перекрывать этот метод
		public function behavior():void {
			
		}
		
	}

}