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
		public static const MONEY_EARN:String = "money_earn";
		public static const MONEY_SPEND:String = "money_spend";
		public static const DEAD:String = "dead";
		public static const COLLECTOR:String = "collector";
		
		public static var awards:Vector.<String>;
		
		public static function create():void {
			awards = new Vector.<String>();
			// kills
			awards.push("firstKill");
			awards.push("bloody");
			awards.push("hardBlooder");
			awards.push("megaBlooder");
			awards.push("mega");
			awards.push("megaBloo");
			
			// driver
			awards.push("driver");
			awards.push("superDriver");
			awards.push("megaDriver");
			awards.push("hellDriver");
			awards.push("phahaDriver");
			
			// money earn
			awards.push("moneyEarn01");
			awards.push("moneyEarn02");
			awards.push("moneyEarn03");
			awards.push("moneyEarn04");
			awards.push("moneyEarn05");
			
			// money spend
			awards.push("moneySpend01");
			awards.push("moneySpend02");
			awards.push("moneySpend03");
			awards.push("moneySpend04");
			awards.push("moneySpend05");
			
			// dead
			awards.push("dead01");
			awards.push("dead02");
			awards.push("dead03");
			awards.push("dead04");
			awards.push("dead05");
			awards.push("dead06");
			
			// collector
			awards.push("collector01");
			awards.push("collector02");
			
			// register stat регистрируем статистику
			AntStatistic.registerStat(KILLS, AntStatisticData.ADD);
			AntStatistic.registerStat(DRIVER, AntStatisticData.MAXIMUM);
			AntStatistic.registerStat(MONEY_EARN, AntStatisticData.ADD);
			AntStatistic.registerStat(MONEY_SPEND, AntStatisticData.ADD);
			AntStatistic.registerStat(DEAD, AntStatisticData.ADD);
			AntStatistic.registerStat(COLLECTOR, AntStatisticData.ADD);
			
			AntStatistic.registerAward(awards[0], KILLS, 1, {title:"First Blood", desc:"Carry an obstacle.", img:AssetLoader.AWARD_KILLS_1});
			AntStatistic.registerAward(awards[1], KILLS, 10, {title:"Junior Maniac.", desc:"Carry 10 obstacles.", img:AssetLoader.AWARD_KILLS_2});
			AntStatistic.registerAward(awards[2], KILLS, 35, {title:"Atrocity on the road.", desc:"Carry 35 obstacles.", img:AssetLoader.AWARD_KILLS_3});
			AntStatistic.registerAward(awards[3], KILLS, 80, { title:"Wild driver.", desc:"80 smash obstacles.", img:AssetLoader.AWARD_KILLS_4 } );
			AntStatistic.registerAward(awards[4], KILLS, 150, { title:"Crazy driving.", desc:"Smash to smithereens 150 obstacles.", img:AssetLoader.AWARD_KILLS_5 } );
			AntStatistic.registerAward(awards[5], KILLS, 300, { title:"Without brakes.", desc:"Carry 300 obstacles.", img:AssetLoader.AWARD_KILLS_6 } );
			
			AntStatistic.registerAward(awards[6], DRIVER, 300, {title:"Driver's license.", desc:"Drive 300 m.", img:AssetLoader.AWARD_DRIVER_1});
			AntStatistic.registerAward(awards[7], DRIVER, 800, {title:"Fan of drive.", desc:"Drive 1 500 m.", img:AssetLoader.AWARD_DRIVER_2});
			AntStatistic.registerAward(awards[8], DRIVER, 1600, {title:"Long trip.", desc:"Drive 4 000 m.", img:AssetLoader.AWARD_DRIVER_3});
			AntStatistic.registerAward(awards[9], DRIVER, 3000, {title:"Without getting tired.", desc:"Drive 10 000 m.", img:AssetLoader.AWARD_DRIVER_4});
			AntStatistic.registerAward(awards[10], DRIVER, 5000, {title:"Devil on the road.", desc:"Drive 30 000 m.", img:AssetLoader.AWARD_DRIVER_5});
			
			AntStatistic.registerAward(awards[11], MONEY_EARN, 10, {title:"First earnings.", desc:"Earn 10 coins.", img:AssetLoader.AWARD_MONEY_EARN_1});
			AntStatistic.registerAward(awards[12], MONEY_EARN, 500, {title:"Hunky.", desc:"Earn 500 coins.", img:AssetLoader.AWARD_MONEY_EARN_2});
			AntStatistic.registerAward(awards[13], MONEY_EARN, 5000, {title:"Good job.", desc:"Earn 5 000 coins.", img:AssetLoader.AWARD_MONEY_EARN_3});
			AntStatistic.registerAward(awards[14], MONEY_EARN, 25000, {title:"Rich man.", desc:"Earn 25 000 coins.", img:AssetLoader.AWARD_MONEY_EARN_4});
			AntStatistic.registerAward(awards[15], MONEY_EARN, 100000, {title:"Oligarch.", desc:"Earn 1 00000 coins.", img:AssetLoader.AWARD_MONEY_EARN_5});
			
			AntStatistic.registerAward(awards[16], MONEY_SPEND, 1, {title:"First cost.", desc:"Spend a coin.", img:AssetLoader.AWARD_MONEY_SPEND_1});
			AntStatistic.registerAward(awards[17], MONEY_SPEND, 5000, {title:"Shopping.", desc:"Spend 5 000 coins.", img:AssetLoader.AWARD_MONEY_SPEND_2});
			AntStatistic.registerAward(awards[18], MONEY_SPEND, 30000, {title:"Spender.", desc:"Spend 30 000 coins.", img:AssetLoader.AWARD_MONEY_SPEND_3});
			AntStatistic.registerAward(awards[19], MONEY_SPEND, 100000, {title:"Embezzler.", desc:"Spend 100 000 coins.", img:AssetLoader.AWARD_MONEY_SPEND_4});
			AntStatistic.registerAward(awards[20], MONEY_SPEND, 2500000, {title:"Maecenas.", desc:"Spend 250 000 coins.", img:AssetLoader.AWARD_MONEY_SPEND_5});
			
			AntStatistic.registerAward(awards[21], DEAD, 1, {title:"The first death.", desc:"Die 1 times.", img:AssetLoader.AWARD_DEAD_1});
			AntStatistic.registerAward(awards[22], DEAD, 15, {title:"Suicide.", desc:"Die 15 times.", img:AssetLoader.AWARD_DEAD_2});
			AntStatistic.registerAward(awards[23], DEAD, 45, {title:"Careless.", desc:"Die 45 times.", img:AssetLoader.AWARD_DEAD_3});
			AntStatistic.registerAward(awards[24], DEAD, 100, {title:"Crazy kamikaze.", desc:"Die 100 times.", img:AssetLoader.AWARD_DEAD_4});
			AntStatistic.registerAward(awards[25], DEAD, 200, {title:"Wild suicide bomber.", desc:"Die 200 times.", img:AssetLoader.AWARD_DEAD_5});
			AntStatistic.registerAward(awards[26], DEAD, 350, {title:"Final death.", desc:"Die 350 times.", img:AssetLoader.AWARD_DEAD_6});
			
			AntStatistic.registerAward(awards[27], COLLECTOR, 1, {title:"New acquisition.", desc:"Buy a new car.", img:AssetLoader.AWARD_COLLECTOR_1});
			AntStatistic.registerAward(awards[28], COLLECTOR, 4, {title:"Collector.", desc:"Collect all transport.", img:AssetLoader.AWARD_COLLECTOR_2});
		}
	}

}