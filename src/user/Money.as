package user 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Money extends EventDispatcher
	{
		public static const CHANGE_BALANCE:String = "change_balance";
		
		public var money:int = 0;
		
		public function incMoney(value:int):void {
			money += value;
			AntStatistic.track(StatAward.MONEY_EARN, value);
		}
		
		public function decMoney(value:int):void {
			if (money < value) {
				return;
			}
			
			AntStatistic.track(StatAward.MONEY_SPEND, value);
			money -= value;
			dispatchEvent(new Event(CHANGE_BALANCE));
		}
		
	}

}