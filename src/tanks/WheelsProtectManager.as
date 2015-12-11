package tanks 
{
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class WheelsProtectManager extends AntEntity 
	{
		private var delay:Number = 0;
		private var game:GameState;
		
		public function WheelsProtectManager(game:GameState) 
		{
			super();
			
			this.game = game;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (GameState.isPause) {
				return;
			}
			
			delay += AntG.elapsed;
			var res:Number = (GameState.speed * AntG.elapsed) / (GameState.speed - 200);
			trace(AntG.elapsed);
			if (delay >= 0.02 ) {
				delay = 0;
				var protectorLeft:WheelProtection = game.defGroup.recycle(WheelProtection) as WheelProtection;
				if (protectorLeft.alive == false){
					protectorLeft.revive();
				}
				
				var protectorRight:WheelProtection = game.defGroup.recycle(WheelProtection) as WheelProtection;
				if (protectorRight.alive == false){
					protectorRight.revive();
				}
				
				protectorLeft.reset(GameState.t.x - 22, GameState.t.y + 16);
				protectorLeft.angle = GameState.t.angle * 2;
				
				protectorRight.reset(GameState.t.x + 10, GameState.t.y + 16);
				protectorRight.angle = GameState.t.angle * 2;
			}
		}
		
	}

}