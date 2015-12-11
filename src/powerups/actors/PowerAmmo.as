package powerups.actors 
{
	import powerups.behaviors.AmmoBehavior;
	import powerups.behaviors.PowerBehaviorBase;
	import powerups.behaviors.ReactionBehavior;
	import user.UserData;
	/**
	 * ...
	 * @author ...
	 */
	public class PowerAmmo extends PowerUpBase 
	{
		
		public function PowerAmmo() 
		{
			super();
			
			addAnimationFromCache(AssetLoader.AMMO_POWERUP);
			animationSpeed = 0.4;
			play();
		}
		
		override protected function collide():void 
		{
			super.collide();
			var r:PowerBehaviorBase = new AmmoBehavior(UserData.powers["powerBullets"].time[UserData.powers["powerBullets"].level]);
			r.init();
		}
		
	}

}