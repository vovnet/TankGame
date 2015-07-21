package user 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
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
		}
		
		public function decMoney(value:int):void {
			if (money < value) {
				return;
			}
			
			money -= value;
			dispatchEvent(new Event(CHANGE_BALANCE));
		}
		
	}

}