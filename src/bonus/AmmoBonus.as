package bonus 
{
	import states.GameState;
	import user.UserData;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AmmoBonus extends BonusBase 
	{
		
		public function AmmoBonus() 
		{
			super();
			
			addAnimationFromCache(AssetLoader.AMMO_BONUS);
			animationSpeed = 0.5;
			playRandomFrame();
			play();
			
			sound = "reload";
		}
		
		override public function update():void 
		{
			super.update();
			if (GameState.isPause) 
			{
				stop();
				return;
			}
			play();
		}
		
		override public function behavior():void 
		{
			super.behavior();
			
			user.UserData.bullets += 1;
		}
		
	}

}