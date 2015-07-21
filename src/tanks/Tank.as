package tanks 
{
	import flash.display.Sprite;
	import powerups.behaviors.PowerBehaviorBase;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntAnimation;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntPoint;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	import states.GameState;
	import tanks.TankControl;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Tank extends AntActor 
	{
		// скорость поворота танка
		public var reaction:int = 3;
		public var angleReaction:int = 10;
		
		// текущий powerUp танка
		public var power:PowerBehaviorBase = null;
		
		// увеличение денег
		public var moneyPercent:Number = 1;
		
		// бесконечные патроны
		public var unlimitedBullets:Boolean = false;
		
		protected var world:GameState;
		
		// управление танком
		protected var control:TankControl;
		
		// прошедлее время между выстрелами
		protected var fireElapsed:Number = 0;
		
		public function Tank(state:GameState) 
		{
			super();
			world = state;
			addAnimationFromCache('tank_001');
			moves = true;
			
			control = new TankControl(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (GameState.isPause) {
				return;
			}
			
			fireElapsed += AntG.elapsed;
			
			if (power != null) {
				power.update();
			}
			
			// управление танком
			control.update();
			
			// стрельба
			if (AntG.keys.isPressed("SPACEBAR")) {
				if (!control.isTurning) {
					if (fireElapsed > 1) {
						fireElapsed = 0;
						fire();
					}
				}
			}
			
		}
		
		/**
		 * Увеличивает денежный счет на указанную сумму
		 * @param	money
		 */
		public function increaceMoney(money:int):void {
			UserData.money.incMoney(money * moneyPercent);
		}
		
		
		private function fire():void {
			if (user.UserData.bullets > 0) {
				world.fire();
				user.UserData.bullets--;
				//trace("bullets: " + UserData.bullets);
			}
		}
		
		
		
	}

}