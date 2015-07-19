package powerups.actors 
{
	import powerups.behaviors.PowerBehaviorBase;
	import powerups.behaviors.ReactionBehavior;
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerReaction extends PowerUpBase 
	{
		
		public function PowerReaction() 
		{
			super();
			
			addAnimationFromCache("power_reaction_mc");
			
		}
		
		override protected function collide():void 
		{
			super.collide();
			var r:PowerBehaviorBase = new ReactionBehavior(UserData.getTimePowerUp("powerReactionLevel"));
			r.init();
		}
		
	}

}