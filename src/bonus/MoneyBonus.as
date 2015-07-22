package bonus 
{
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MoneyBonus extends BonusBase 
	{
		
		public function MoneyBonus() 
		{
			super();
			
			addAnimationFromCache("money");
			animationSpeed = 0.2;
			play();
			
		}
		
		override public function behavior():void 
		{
			super.behavior();
			
			GameState.t.increaceMoney(10);
		}
		
		
	}

}