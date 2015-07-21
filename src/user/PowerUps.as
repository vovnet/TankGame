package user 
{
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerUps 
	{
		// уровни паверапов
		public var powerLevels:Object = { powerReactionLevel:0, powerMoneyLevel:0, powerBulletsLevel:0 };
		
		// стоимость апгрейда паверапов
		public var powerReactionPrice:Array = [20, 30, 50, 90, 130];
		public var powerMoneyPrice:Array = [250, 390, 600, 900, 1600];
		public var powerBulletsPrice:Array = [390, 500, 900, 1000, 1800];
		
		
	}

}