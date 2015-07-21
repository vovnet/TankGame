package user 
{
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import ru.antkarlov.anthill.extensions.stats.AntStatisticData;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class StatAward 
	{
		// const of statistics
		public static const KILLS:String = "kills";
		public static const DRIVER:String = "driver";
		
		public static var awards:Vector.<String>;
		
		public static function create():void {
			awards = new Vector.<String>();
			// kills
			awards.push("firstKill");
			awards.push("bloody");
			awards.push("hardBlooder");
			awards.push("megaBlooder");
			
			// driver
			awards.push("driver");
			awards.push("superDriver");
			awards.push("megaDriver");
			awards.push("hellDriver");
			
			// register stat регистрируем статистику
			AntStatistic.registerStat(KILLS, AntStatisticData.ADD);
			AntStatistic.registerStat(DRIVER, AntStatisticData.MAXIMUM);
			
			AntStatistic.registerAward(awards[0], KILLS, 1, {title:"First Blood", desc:"Kill an enemy.", img:"award_001"});
			AntStatistic.registerAward(awards[1], KILLS, 9, {title:"Junior Maniac.", desc:"Kill 9 enemies.", img:"award_002"});
			AntStatistic.registerAward(awards[2], KILLS, 18, {title:"Убить - как пить дать.", desc:"Замочить 18 врагов.", img:"award_003"});
			AntStatistic.registerAward(awards[3], KILLS, 28, { title:"Психопат в огороде.", desc:"Замочить 28 врагов.", img:"award_004" } );
			
			AntStatistic.registerAward(awards[4], DRIVER, 500, {title:"Получил права.", desc:"Проехать 500 м.", img:"award_005"});
			AntStatistic.registerAward(awards[5], DRIVER, 2000, {title:"Покатушник.", desc:"Проехать 2 000 м.", img:"award_005"});
			AntStatistic.registerAward(awards[6], DRIVER, 5000, {title:"Езда без правил.", desc:"Проехать 5 000 м.", img:"award_005"});
			AntStatistic.registerAward(awards[7], DRIVER, 10000, {title:"Дьявол на дороге.", desc:"Проехать 10 000 м.", img:"award_005"});
		}
	}

}