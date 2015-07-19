package powerups.actors 
{
	import powerups.behaviors.PowerBehaviorBase;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerMoney extends PowerUpBase 
	{
		
		public function PowerMoney() 
		{
			super();
			
			addAnimationFromCache("coin_mc");
		}
		
		override protected function collide():void 
		{
			super.collide();
			
			var r:PowerBehaviorBase = new MoneyBehavior(UserData.getTimePowerUp("powerMoneyLevel");
			r.init();
		}
		
	}

}