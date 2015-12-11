package powerups.behaviors 
{
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	/**
	 * Базовый класс для всех паверапов.
	 * Нужно только создать объект и вызвать метод init()
	 * 		var r:PowerBase = new Reaction(5);
	 * 		r.init();
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerBehaviorBase 
	{
		// время действия паверапа
		public var timeUp:Number = 10;
		
		// счетчик времени работы паверапа
		public var countTime:Number = 0;
		
		// id паверапа
		public var id:int = 0;
		
		/**
		 * Constructor
		 * @param	time Время которое будет работать паверап
		 */
		public function PowerBehaviorBase(time:Number = 10) 
		{
			timeUp = time;
		}
		
		public function update():void {
			countTime += AntG.elapsed;
			AntG.watchValue("countUp: ", countTime);
			if (countTime > timeUp) {
				kill();
			}
		}
		
		public function init():void {
			if (GameState.t.power != null) {
				GameState.t.power.kill();
			}
			GameState.t.power = this;
			//trace("init power up");
		}
		
		public function kill():void {
			GameState.t.power = null;
			//trace("power up is over: " + countTime);
		}
		
	}

}