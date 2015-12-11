package tanks 
{
	import flash.display.Sprite;
	import powerups.behaviors.PowerBehaviorBase;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntAnimation;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntPoint;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	import states.GameState;
	import tanks.TankControl;
	import user.StatAward;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Tank extends AntActor 
	{
		// скорость поворота танка
		public var reaction:Number = 4.0;
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
		
		// graphics
		protected var actor:AntActor = new AntActor();
		
		// бесконечны ли патроны
		public var isAmmoAnlim:Boolean = false;
		
		public function Tank(state:GameState) 
		{
			super();
			world = state;
			initTank();
			actor.x -= 40;
			actor.y -= 36;
			actor.animationSpeed = 0.4;
			actor.play();
			add(actor);
			//moves = true;
			
			control = new TankControl(this);
		}
		
		
		override public function update():void 
		{
			super.update();
			
			if (GameState.isPause) {
				actor.stop();
				return;
			}
			if (!actor.isPlaying) actor.play();
			
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
			if (user.UserData.bullets > 0 || isAmmoAnlim) {
				world.fire();
				// уменьшаем патроны, если они не безлемитны
				if (!isAmmoAnlim) {
					user.UserData.bullets--;
				}
			}
		}
		
		private function initTank():void 
		{
			switch (UserData.tankId) {
				case 1:
					actor.addAnimationFromCache(AssetLoader.TANK_01);
					reaction = 2.0;
					break;
				case 2:
					actor.addAnimationFromCache(AssetLoader.TANK_02);
					reaction = 2.2;
					break;
				case 3:
					actor.addAnimationFromCache(AssetLoader.TANK_03);
					reaction = 2.4;
					break;
				case 4:
					actor.addAnimationFromCache(AssetLoader.TANK_04);
					reaction = 2.6;
					break;
				case 5:
					actor.addAnimationFromCache(AssetLoader.TANK_05);
					reaction = 2.8;
					break;
				default:
					throw new Error("Нет танка с таким id");
					break;
			}
		}
		
		
		
	}

}