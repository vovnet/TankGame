package powerups.actors 
{
	import powerups.behaviors.MoneyBehavior;
	import powerups.behaviors.PowerBehaviorBase;
	import user.UserData;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerMoney extends PowerUpBase 
	{
		
		public function PowerMoney() 
		{
			super();
			
			addAnimationFromCache(AssetLoader.MONEY_POWERUP);
			animationSpeed = 0.4;
			play();
		}
		
		override protected function collide():void 
		{
			super.collide();
			var r:PowerBehaviorBase = new MoneyBehavior(UserData.powers["powerMoney"].time[UserData.powers["powerMoney"].level]);
			r.init();
		}
		
	}

}