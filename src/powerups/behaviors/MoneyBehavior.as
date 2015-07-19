package powerups.behaviors 
{
	import powerups.behaviors.PowerBehaviorBase;
	import states.GameState;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MoneyBehavior extends PowerBehaviorBase 
	{
		
		public function MoneyBehavior(time:Number = 10) 
		{
			super(time);
			
		}
		
		override public function init():void 
		{
			super.init();
			GameState.t.moneyPercent = 2;
		}
		
		override public function kill():void 
		{
			GameState.t.moneyPercent = 1;
			super.kill();
		}
		
	}

}