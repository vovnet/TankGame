package powerups.behaviors 
{
	import powerups.behaviors.PowerBehaviorBase;
	import states.GameState;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class ReactionBehavior extends PowerBehaviorBase 
	{
		
		public function ReactionBehavior(time:Number = 10) 
		{
			super(time);
			
			id = 2;
		}
		
		override public function init():void 
		{
			super.init();
			
			GameState.t.reaction += 2.5;
			GameState.t.angleReaction += 10;
		}
		
		override public function kill():void 
		{
			GameState.t.reaction -= 2.5;
			GameState.t.angleReaction -= 10;
			super.kill();
		}
		
	}

}