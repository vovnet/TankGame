package powerups.behaviors 
{
	import states.GameState;
	/**
	 * ...
	 * @author ...
	 */
	public class AmmoBehavior extends PowerBehaviorBase 
	{
		
		public function AmmoBehavior(time:Number=10) 
		{
			super(time);
			
			id = 3;
		}
		
		override public function init():void 
		{
			super.init();
			
			GameState.t.isAmmoAnlim = true;
		}
		
		override public function kill():void 
		{
			GameState.t.isAmmoAnlim = false;
			super.kill();
			
		}
		
	}

}