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
			
			addAnimationFromCache("coin_mc");
			
		}
		
		override public function behavior():void 
		{
			super.behavior();
			
			GameState.t.increaceMoney(10);
		}
		
		
	}

}