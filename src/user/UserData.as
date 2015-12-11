package user 
{
	import adobe.utils.CustomActions;
	import flash.utils.Dictionary;
	import powerups.actors.PowerUpBase;
	import ru.antkarlov.anthill.AntCookie;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.upgrade.PowerUpBullets;
	import states.upgrade.PowerUpMoney;
	import states.upgrade.PowerUpReaction;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class UserData 
	{
		public static var money:Money = new Money();
		public static var bullets:int = 50;
		public static var level:int = 0;
		public static var tankId:int = 1;
		
		public static var isBuyTank1:Boolean = true;
		public static var isBuyTank2:Boolean = false;
		public static var isBuyTank3:Boolean = false;
		public static var isBuyTank4:Boolean = false;
		public static var isBuyTank5:Boolean = false;
		
		public static var powers:Object = new Object();
		
		private static var saveName:String = "RushOfTanks";
		private static var isExistSave:Boolean = true;
		
		public static function load():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			powers["powerReaction"] = new PowerUpReaction();
			powers["powerMoney"] = new PowerUpMoney();
			powers["powerBullets"] = new PowerUpBullets();
			
			// если игра запущена в первый раз, то не загружаем ничего
			isExistSave = cookie.read("isExistSave");
			if (!isExistSave) {
				return;
			}
			
			// загрузка локальных сохранений
			money.money = int(cookie.read("money"));
			bullets = int(cookie.read("bullets"));
			tankId = int(cookie.read("tankId"));
			
			powers["powerReaction"].level = int(cookie.read("powerReactionLevel"));
			powers["powerReaction"].isMaxUpgrade = Boolean(cookie.read("powerReactionIsMax"));
			
			powers["powerMoney"].level = int(cookie.read("powerMoneyLevel"));
			powers["powerMoney"].isMaxUpgrade = Boolean(cookie.read("powerMoneyIsMax"));
			
			powers["powerBullets"].level = int(cookie.read("powerBulletsLevel"));
			powers["powerBullets"].isMaxUpgrade = int(cookie.read("powerBulletsIsMax"));
			
			isBuyTank2 = Boolean(cookie.read("isBuyTank2"));
			isBuyTank3 = Boolean(cookie.read("isBuyTank3"));
			isBuyTank4 = Boolean(cookie.read("isBuyTank4"));
			isBuyTank5 = Boolean(cookie.read("isBuyTank5"));
			
			AntStatistic.loadData();
		}
		
		public static function save():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			isExistSave = true;
			cookie.write("isExistSave", isExistSave);
			cookie.write("money", money.money);
			cookie.write("bullets", bullets);
			cookie.write("tankId", tankId);
			
			cookie.write("powerReactionLevel", powers["powerReaction"].level);
			cookie.write("powerReactionIsMax", powers["powerReaction"].isMaxUpgrade);
			
			cookie.write("powerMoneyLevel", powers["powerMoney"].level);
			cookie.write("powerMoneyIsMax", powers["powerMoney"].isMaxUpgrade);
			
			cookie.write("powerBulletsLevel", powers["powerBullets"].level);
			cookie.write("powerBulletsIsMax", powers["powerBullets"].isMaxUpgrade);
			
			cookie.write("isBuyTank2", isBuyTank2);
			cookie.write("isBuyTank3", isBuyTank3);
			cookie.write("isBuyTank4", isBuyTank4);
			cookie.write("isBuyTank5", isBuyTank5);
			
			AntStatistic.saveData();
		}
		
		/**
		 * Удаляет сохранения
		 */
		public static function clear():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			isExistSave = false;
			cookie.write("isExistSave", isExistSave);
			
			money.money = 0;
			bullets = 50;
			tankId = 1;
			
			isBuyTank2 = false;
			isBuyTank3 = false;
			isBuyTank4 = false;
			isBuyTank5 = false;
			
			powers["powerReaction"] = new PowerUpReaction();
			powers["powerMoney"] = new PowerUpMoney();
			powers["powerBullets"] = new PowerUpBullets();
			
			AntStatistic.clearData();
		}
		
		
		
		/**
		 * Возвращает время действия паверапа
		 * @param	powerUp (powerReactionLevel, powerMoneyLevel, powerBulletsLevel)
		 * @return
		 */
		
		 /*
		public static function getTimePowerUp(powerUp:String):int {
			switch (powers[powerUp].level) {
				case 0:
					return 10;
					break;
				case 1:
					return 16;
					break;
				case 2:
					return 24;
					break;
				case 3:
					return 32;
					break;
				case 4:
					return 40;
					break;
				case 5:
					return 50;
					break;
				default:
					return 10;
					break;
			}
		}
		*/
		
		
		
	}

}