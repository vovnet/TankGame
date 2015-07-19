package enemies.blockposts 
{
	import adobe.utils.CustomActions;
	import bonus.AmmoBonus;
	import bonus.MoneyBonus;
	import enemies.AntiTank;
	import enemies.BricksEnemy;
	import enemies.PitEnemy;
	import flash.events.DataEvent;
	import powerups.actors.PowerReaction;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.AntState;
	/**
	 * Хранит данные о противниках на уровне
	 * Респаунит врагов
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class BlockPost 
	{
		// уровни сложности
		private static var lowLevel:Vector.<BlockPostData>;
		private static var middleLevel:Vector.<BlockPostData>;
		private static var hightLevel:Vector.<BlockPostData>;
		private static var hardLevel:Vector.<BlockPostData>;
		
		/**
		 * levels[lvl][rand][block]
		 * Первый параметр уровень игрока, рандомный блок пост из списка,
		 * сам блок в блокпосте
		 */
		private static var levels:Vector.<Vector.<BlockPostData>>;
		
		public static function init():void {
			lowLevel = new Vector.<BlockPostData>();
			middleLevel = new Vector.<BlockPostData>();
			hightLevel = new Vector.<BlockPostData>();
			hardLevel = new Vector.<BlockPostData>();
			
			var data1:BlockPostData = new BlockPostData(30);
			data1.addBlock(90, -100, BricksEnemy);
			data1.addBlock(165, -100, BricksEnemy);
			data1.addBlock(165, -40, PitEnemy);
			data1.addBlock(240, -40, MoneyBonus);
			data1.addBlock(315, -100, PowerReaction);
			data1.addBlock(90, -160, AmmoBonus);
			data1.addBlock(90, -220, AmmoBonus);
			lowLevel.push(data1);
			
			var data2:BlockPostData = new BlockPostData(20);
			data2.addBlock(90, -100, BricksEnemy);
			data2.addBlock(165, -100, BricksEnemy);
			data2.addBlock(240, -100, BricksEnemy);
			data2.addBlock(315, -100, BricksEnemy);
			lowLevel.push(data2);
			
			var data3:BlockPostData = new BlockPostData(35);
			data3.addBlock(90, -400, MoneyBonus);
			data3.addBlock(90, -280, MoneyBonus);
			data3.addBlock(90, -160, MoneyBonus);
			data3.addBlock(90, -40, MoneyBonus);
			lowLevel.push(data3);
			
			var data4:BlockPostData = new BlockPostData(35);
			data4.addBlock(90, -100, AntiTank);
			data4.addBlock(240, -100, AntiTank);
			data4.addBlock(90, -40, AntiTank);
			lowLevel.push(data4);
			
			var data5:BlockPostData = new BlockPostData(35);
			data5.addBlock(90, -100, AntiTank);
			data5.addBlock(240, -100, AntiTank);
			data5.addBlock(90, -40, AntiTank);
			lowLevel.push(data5);
			
			var data6:BlockPostData = new BlockPostData(40);
			data6.addBlock(90, -100, AntiTank);
			data6.addBlock(240, -100, AntiTank);
			data6.addBlock(90, -40, AntiTank);
			data6.addBlock(165, -340, AntiTank);
			data6.addBlock(165, -100, MoneyBonus);
			data6.addBlock(165, -40, MoneyBonus);
			data6.addBlock(165, -160, MoneyBonus);
			data6.addBlock(165, -220, MoneyBonus);
			lowLevel.push(data6);
			
			var data7:BlockPostData = new BlockPostData(30);
			data7.addBlock(165, -400, MoneyBonus);
			data7.addBlock(240, -280, MoneyBonus);
			data7.addBlock(165, -160, MoneyBonus);
			data7.addBlock(240, -40, MoneyBonus);
			lowLevel.push(data7);
			
			
			levels = new Vector.<Vector.<BlockPostData>>();
			levels.push(lowLevel);
			levels.push(middleLevel);
			levels.push(hightLevel);
			levels.push(hardLevel);
		}
		
		/**
		 * Добавляет блок пост на карту
		 * @param	canvas карта
		 * @return возвращает расстояние до следующего блокпоста
		 */
		public static function respawn(canvas:AntState):int {
			
			var rand:Number = AntMath.randomRangeInt(0, levels[UserData.level].length - 1);
			
			var blocksList:Vector.<SimpleBlockData> = levels[UserData.level][rand].blocks;
			
			for (var i:int = 0; i < blocksList.length; i++) {
				
				var block:SimpleBlockData = blocksList[i];
				var actor:AntActor = block.type(canvas.defGroup.recycle(block.type));
				
				if (actor.alive == false)
				{
					actor.reset(block.posX, block.posY);
					actor.revive();
				} else {
					actor.x = block.posX;
					actor.y = block.posY;
				}
			}
			
			return levels[UserData.level][rand].length;
		}
		
	}

}