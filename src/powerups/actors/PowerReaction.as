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
			
			addAnimationFromCache("power_reaction_mc");
			
		}
		
		override protected function collide():void 
		{
			super.collide();
			var r:PowerBehaviorBase = new ReactionBehavior(UserData.powers["powerReaction"].time[UserData.powers["powerReaction"].level]);
			r.init();
		}
		
	}

}