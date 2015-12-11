package powerups.actors 
{
	import powerups.behaviors.PowerBehaviorBase;
	import powerups.behaviors.ReactionBehavior;
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerReaction extends PowerUpBase 
	{
		
		public function PowerReaction() 
		{
			super();
			
			addAnimationFromCache(AssetLoader.REACTION_POWERUP);
			animationSpeed = 0.4;
			play();
		}
		
		override protected function collide():void 
		{
			super.collide();
			var r:PowerBehaviorBase = new ReactionBehavior(UserData.powers["powerReaction"].time[UserData.powers["powerReaction"].level]);
			r.init();
		}
		
	}

}