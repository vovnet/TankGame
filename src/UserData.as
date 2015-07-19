package 
{
	import flash.utils.Dictionary;
	import ru.antkarlov.anthill.AntCookie;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class UserData 
	{
		public static var money:int = 0;
		public static var bullets:int = 50;
		public static var level:int = 0;
		public static var tankId:int = 1;
		
		// значения уровней паверапов
		public static var powerLevels:Object = { powerReactionLevel:1, powerMoneyLevel:1, powerBulletsLevel:1 };
		
		private static var saveName:String = "game002";
		private static var isExistSave:Boolean = true;
		
		public static function load():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			// если игра запущена в первый раз, то не загружаем ничего
			isExistSave = cookie.read("isExistSave");
			if (!isExistSave) return;
			
			// загрузка локальных сохранений
			money = int(cookie.read("money"));
			bullets = int(cookie.read("bullets"));
			level = int(cookie.read("level"));
			tankId = int(cookie.read("tankId"));
			powerLevels["powerReactionLevel"] = int(cookie.read("powerReactionLevel"));
			powerLevels["powerMoneyLevel"] = int(cookie.read("powerMoneyLevel"));
			powerLevels["powerBulletsLevel"] = int(cookie.read("powerBulletsLevel"));
		}
		
		public static function save():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			isExistSave = true;
			cookie.write("isExistSave", isExistSave);
			cookie.write("money", money);
			cookie.write("bullets", bullets);
			cookie.write("level", level);
			cookie.write("tankId", tankId);
			cookie.write("powerReactionLevel", powerLevels["powerReactionLevel"]);
			cookie.write("powerMoneyLevel", powerLevels["powerMoneyLevel"]);
			cookie.write("powerBulletsLevel", powerLevels["powerBulletsLevel"]);
		}
		
		/**
		 * Удаляет сохранения
		 */
		public static function clear():void {
			var cookie:AntCookie = new AntCookie();
			cookie.open(saveName);
			
			isExistSave = false;
			cookie.write("isExistSave", isExistSave);
			
			money = 0;
			bullets = 50;
			level = 0;
			tankId = 1;
		}
		
		/**
		 * Возвращает время действия паверапа
		 * @param	powerUp (powerReactionLevel, powerMoneyLevel, powerBulletsLevel)
		 * @return
		 */
		public static function getTimePowerUp(powerUp:String):int {
			switch (powerLevels[powerUp]) {
				case 1:
					return 10;
					break;
				case 2:
					return 16;
					break;
				case 3:
					return 24;
					break;
				case 4:
					return 32;
					break;
				case 5:
					return 40;
					break;
				default:
					return 10;
					break;
			}
		}
		
	}

}