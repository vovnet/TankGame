package user 
{
	import adobe.utils.CustomActions;
	import flash.utils.Dictionary;
	import powerups.actors.PowerUpBase;
	import ru.antkarlov.anthill.AntCookie;
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
		
		public static var powers:Object = new Object();
		
		private static var saveName:String = "game002";
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
			
			powers["powerReaction"] = new PowerUpReaction();
			powers["powerMoney"] = new PowerUpMoney();
			powers["powerBullets"] = new PowerUpBullets();
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