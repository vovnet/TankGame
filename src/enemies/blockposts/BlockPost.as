package enemies.blockposts 
{
	import adobe.utils.CustomActions;
	import bonus.AmmoBonus;
	import bonus.MoneyBonus;
	import enemies.AntiTank;
	import enemies.BricksEnemy;
	import enemies.Mine;
	import enemies.PitEnemy;
	import flash.events.DataEvent;
	import powerups.actors.PowerAmmo;
	import powerups.actors.PowerMoney;
	import powerups.actors.PowerReaction;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.AntState;
	import states.GameState;
	import user.UserData;
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
		
		private static const LINE_1:int = 45;
		private static const LINE_2:int = 134;
		private static const LINE_3:int = 222;
		private static const LINE_4:int = 310;
		
		public static function init():void {
			lowLevel = new Vector.<BlockPostData>();
			middleLevel = new Vector.<BlockPostData>();
			hightLevel = new Vector.<BlockPostData>();
			hardLevel = new Vector.<BlockPostData>();
			
			makeLowLevel();
			makeMiddleLevel();
			makeHightLevel();
			makeHardLevel();
			
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
		public static function respawn(canvas:GameState):int {
			
			var rand:Number = AntMath.randomRangeInt(0, levels[user.UserData.level].length - 1);
			
			var blocksList:Vector.<SimpleBlockData> = levels[user.UserData.level][rand].blocks;
			
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
				actor.z = 20;
				canvas.mainLayer.add(actor);
			}
			
			return levels[user.UserData.level][rand].length;
		}
		
		static private function makeHardLevel():void {
			
		}
		
		static private function makeHightLevel():void {
			var data:BlockPostData = new BlockPostData(35);
			data.addBlock(24, -130, BricksEnemy);
			data.addBlock(213, -129, BricksEnemy);
			data.addBlock(133, -357, AntiTank);
			data.addBlock(314, -358, AntiTank);
			data.addBlock(240, -352, Mine);
			data.addBlock(48, -358, Mine);
			data.addBlock(64, -502, AmmoBonus);
			data.addBlock(253, -502, AmmoBonus);
			hightLevel.push(data);
			
			var data2:BlockPostData = new BlockPostData(35);
			data2.addBlock(48, -226, PitEnemy);
			data2.addBlock(142, -226, PitEnemy);
			data2.addBlock(229, -204, AntiTank);
			data2.addBlock(227, -310, AntiTank);
			data2.addBlock(336, -285, MoneyBonus);
			data2.addBlock(335, -380, MoneyBonus);
			data2.addBlock(335, -478, MoneyBonus);
			hightLevel.push(data2);
			
			var data3:BlockPostData = new BlockPostData(35);
			data3.addBlock(135, -178, AntiTank);
			data3.addBlock(227, -119, AntiTank);
			data3.addBlock(317, -382, AntiTank);
			data3.addBlock(226, -379, AntiTank);
			data3.addBlock(44, -596, AntiTank);
			data3.addBlock(133, -594, AntiTank);
			data3.addBlock(325, -141, PowerReaction);
			data3.addBlock(252, -238, AmmoBonus);
			data3.addBlock(162, -325, AmmoBonus);
			hightLevel.push(data3);
			
			var data4:BlockPostData = new BlockPostData(35);
			data4.addBlock(119, -237, BricksEnemy);
			data4.addBlock(120, -448, BricksEnemy);
			data4.addBlock(310, -236, BricksEnemy);
			data4.addBlock(307, -443, BricksEnemy);
			data4.addBlock(230, -298, AntiTank);
			data4.addBlock(39, -302, AntiTank);
			data4.addBlock(42, -457, AntiTank);
			data4.addBlock(229, -454, AntiTank);
			data4.addBlock(141, -351, PowerReaction);
			data4.addBlock(331, -349, PowerMoney);
			data4.addBlock(340, -530, MoneyBonus);
			data4.addBlock(154, -527, MoneyBonus);
			hightLevel.push(data4);
			
			var data5:BlockPostData = new BlockPostData(45);
			data5.addBlock(145, -187, Mine);
			data5.addBlock(236, -420, Mine);
			data5.addBlock(22, -86, BricksEnemy);
			data5.addBlock(24, -294, BricksEnemy);
			data5.addBlock(21, -502, BricksEnemy);
			data5.addBlock(301, -185, BricksEnemy);
			data5.addBlock(299, -413, BricksEnemy);
			data5.addBlock(299, -594, BricksEnemy);
			data5.addBlock(65, -181, AmmoBonus);
			data5.addBlock(67, -400, AmmoBonus);
			data5.addBlock(344, -299, AmmoBonus);
			data5.addBlock(338, -513, AmmoBonus);
			data5.addBlock(246, -124, MoneyBonus);
			data5.addBlock(246, -231, MoneyBonus);
			data5.addBlock(157, -325, MoneyBonus);
			data5.addBlock(159, -437, MoneyBonus);
			hightLevel.push(data5);
			
			var data6:BlockPostData = new BlockPostData(35);
			data6.addBlock(154, -92, MoneyBonus);
			data6.addBlock(155, -163, MoneyBonus);
			data6.addBlock(154, -240, MoneyBonus);
			data6.addBlock(157, -313, MoneyBonus);
			data6.addBlock(156, -389, MoneyBonus);
			data6.addBlock(158, -461, MoneyBonus);
			data6.addBlock(155, -542, MoneyBonus);
			data6.addBlock(251, -124, MoneyBonus);
			data6.addBlock(251, -200, MoneyBonus);
			data6.addBlock(251, -276, MoneyBonus);
			data6.addBlock(252, -353, MoneyBonus);
			data6.addBlock(248, -434, MoneyBonus);
			data6.addBlock(248, -505, MoneyBonus);
			data6.addBlock(248, -579, MoneyBonus);
			data6.addBlock(24, -106, BricksEnemy);
			data6.addBlock(25, -256, BricksEnemy);
			data6.addBlock(25, -399, BricksEnemy);
			data6.addBlock(28, -542, BricksEnemy);
			data6.addBlock(318, -118, AntiTank);
			data6.addBlock(315, -304, AntiTank);
			data6.addBlock(315, -494, AntiTank);
			hightLevel.push(data6);
			
			var data7:BlockPostData = new BlockPostData(35);
			data7.addBlock(56, -354, PowerAmmo);
			data7.addBlock(330, -353, PowerAmmo);
			data7.addBlock(144, -350, PowerMoney);
			data7.addBlock(239, -351, PowerReaction);
			data7.addBlock(24, -163, BricksEnemy);
			data7.addBlock(118, -161, BricksEnemy);
			data7.addBlock(213, -160, BricksEnemy);
			data7.addBlock(308, -159, BricksEnemy);
			data7.addBlock(28, -517, BricksEnemy);
			data7.addBlock(301, -513, BricksEnemy);
			hightLevel.push(data7);
			
			var data8:BlockPostData = new BlockPostData(35);
			data8.addBlock(112, -290, BricksEnemy);
			data8.addBlock(215, -290, BricksEnemy);
			data8.addBlock(41, -232, AntiTank);
			data8.addBlock(318, -234, AntiTank);
			data8.addBlock(141, -521, PitEnemy);
			data8.addBlock(233, -130, PitEnemy);
			data8.addBlock(152, -74, MoneyBonus);
			data8.addBlock(153, -150, MoneyBonus);
			data8.addBlock(155, -228, MoneyBonus);
			data8.addBlock(248, -354, MoneyBonus);
			data8.addBlock(248, -441, MoneyBonus);
			data8.addBlock(248, -527, MoneyBonus);
			hightLevel.push(data8);
			
			var data9:BlockPostData = new BlockPostData(35);
			data9.addBlock(28, -109, BricksEnemy);
			data9.addBlock(119, -243, BricksEnemy);
			data9.addBlock(217, -378, BricksEnemy);
			data9.addBlock(45, -367, AntiTank);
			data9.addBlock(138, -525, AntiTank);
			data9.addBlock(68, -212, AmmoBonus);
			data9.addBlock(163, -399, AmmoBonus);
			data9.addBlock(299, -557, BricksEnemy);
			data9.addBlock(250, -550, MoneyBonus);
			hightLevel.push(data9);
		}
		
		static private function makeMiddleLevel():void {
			var data:BlockPostData = new BlockPostData(35);
			data.addBlock(62, -124, MoneyBonus);
			data.addBlock(62, -215, MoneyBonus);
			data.addBlock(63, -308, MoneyBonus);
			data.addBlock(64, -403, MoneyBonus);
			data.addBlock(326, -287, PowerAmmo);
			data.addBlock(119, -126, BricksEnemy);
			data.addBlock(322, -489, PitEnemy);
			data.addBlock(324, -130, PitEnemy);
			data.addBlock(143, -266, Mine);
			middleLevel.push(data);
			
			var data2:BlockPostData = new BlockPostData(35);
			data2.addBlock(144, -173, Mine);
			data2.addBlock(238, -268, Mine);
			data2.addBlock(329, -182, Mine);
			data2.addBlock(236, -97, PowerMoney);
			middleLevel.push(data2);
			
			var data3:BlockPostData = new BlockPostData(35);
			data3.addBlock(139, -246, PitEnemy);
			data3.addBlock(326, -250, PitEnemy);
			data3.addBlock(228, -225, AntiTank);
			data3.addBlock(229, -326, AntiTank);
			data3.addBlock(43, -454, AntiTank);
			data3.addBlock(42, -560, AntiTank);
			data3.addBlock(342, -476, AmmoBonus);
			data3.addBlock(341, -575, AmmoBonus);
			middleLevel.push(data3);
			
			var data4:BlockPostData = new BlockPostData(35);
			data4.addBlock(43, -251, AntiTank);
			data4.addBlock(42, -353, AntiTank);
			data4.addBlock(131, -252, AntiTank);
			data4.addBlock(133, -354, AntiTank);
			data4.addBlock(49, -545, PowerMoney);
			data4.addBlock(335, -266, MoneyBonus);
			data4.addBlock(336, -341, MoneyBonus);
			data4.addBlock(336, -418, MoneyBonus);
			data4.addBlock(335, -498, MoneyBonus);
			data4.addBlock(235, -602, PitEnemy);
			middleLevel.push(data4);
			
			var data5:BlockPostData = new BlockPostData(35);
			data5.addBlock(145, -102, Mine);
			data5.addBlock(143, -200, Mine);
			data5.addBlock(139, -299, Mine);
			data5.addBlock(242, -296, Mine);
			data5.addBlock(52, -301, Mine);
			data5.addBlock(325, -499, Mine);
			data5.addBlock(212, -553, BricksEnemy);
			data5.addBlock(112, -555, BricksEnemy);
			middleLevel.push(data5);
			
			var data6:BlockPostData = new BlockPostData(35);
			data6.addBlock(229, -220, AntiTank);
			data6.addBlock(131, -220, AntiTank);
			data6.addBlock(315, -457, AntiTank);
			data6.addBlock(40, -461, AntiTank);
			data6.addBlock(61, -96, MoneyBonus);
			data6.addBlock(63, -183, MoneyBonus);
			data6.addBlock(64, -278, MoneyBonus);
			data6.addBlock(155, -369, MoneyBonus);
			data6.addBlock(154, -457, MoneyBonus);
			data6.addBlock(340, -211, AmmoBonus);
			data6.addBlock(256, -372, AmmoBonus);
			middleLevel.push(data6);
			
			var data7:BlockPostData = new BlockPostData(35);
			data7.addBlock(238, -342, PowerReaction);
			data7.addBlock(229, -235, AntiTank);
			data7.addBlock(132, -235, AntiTank);
			data7.addBlock(143, -340, PowerMoney);
			data7.addBlock(313, -520, AntiTank);
			data7.addBlock(40, -520, AntiTank);
			data7.addBlock(63, -118, MoneyBonus);
			data7.addBlock(63, -199, MoneyBonus);
			data7.addBlock(63, -285, MoneyBonus);
			data7.addBlock(340, -112, MoneyBonus);
			data7.addBlock(340, -197, MoneyBonus);
			data7.addBlock(335, -284, MoneyBonus);
			middleLevel.push(data7);
			
			var data8:BlockPostData = new BlockPostData(45);
			data8.addBlock(119, -60, BricksEnemy);
			data8.addBlock(210, -244, BricksEnemy);
			data8.addBlock(118, -426, BricksEnemy);
			data8.addBlock(215, -604, BricksEnemy);
			data8.addBlock(56, -85, Mine);
			data8.addBlock(325, -84, Mine);
			data8.addBlock(316, -251, AntiTank);
			data8.addBlock(318, -602, AntiTank);
			data8.addBlock(43, -435, AntiTank);
			data8.addBlock(247, -75, MoneyBonus);
			data8.addBlock(153, -165, MoneyBonus);
			data8.addBlock(154, -266, MoneyBonus);
			data8.addBlock(249, -360, MoneyBonus);
			data8.addBlock(246, -472, MoneyBonus);
			data8.addBlock(159, -544, MoneyBonus);
			middleLevel.push(data8);
			
			var data9:BlockPostData = new BlockPostData(35);
			data9.addBlock(228, -188, AntiTank);
			data9.addBlock(313, -188, AntiTank);
			data9.addBlock(341, -276, AmmoBonus);
			data9.addBlock(340, -365, AmmoBonus);
			data9.addBlock(322, -532, PitEnemy);
			data9.addBlock(138, -213, PitEnemy);
			data9.addBlock(63, -80, MoneyBonus);
			data9.addBlock(63, -165, MoneyBonus);
			data9.addBlock(65, -250, MoneyBonus);
			data9.addBlock(53, -418, Mine);
			data9.addBlock(146, -599, Mine);
			middleLevel.push(data9);
			
			var data10:BlockPostData = new BlockPostData(35);
			data10.addBlock(131, -229, AntiTank);
			data10.addBlock(133, -335, AntiTank);
			data10.addBlock(229, -401, AntiTank);
			data10.addBlock(226, -514, AntiTank);
			data10.addBlock(146, -463, PowerAmmo);
			data10.addBlock(340, -109, MoneyBonus);
			data10.addBlock(340, -192, MoneyBonus);
			data10.addBlock(337, -284, MoneyBonus);
			data10.addBlock(307, -492, BricksEnemy);
			data10.addBlock(29, -577, BricksEnemy);
			middleLevel.push(data10);
		}
		
		static private function makeLowLevel():void {
			var data:BlockPostData = new BlockPostData(35);
			data.addBlock(118, -114, BricksEnemy);
			data.addBlock(310, -112, BricksEnemy);
			data.addBlock(27, -229, BricksEnemy);
			data.addBlock(61, -53, MoneyBonus);
			data.addBlock(64, -142, MoneyBonus);
			data.addBlock(250, -153, MoneyBonus);
			data.addBlock(251, -234, MoneyBonus);
			data.addBlock(251, -317, MoneyBonus);
			lowLevel.push(data);
			
			var data2:BlockPostData = new BlockPostData(35);
			data2.addBlock(155, -80, MoneyBonus);
			data2.addBlock(251, -185, MoneyBonus);
			data2.addBlock(157, -288, MoneyBonus);
			data2.addBlock(251, -401, MoneyBonus);
			data2.addBlock(155, -514, MoneyBonus);
			lowLevel.push(data2);
			
			var data3:BlockPostData = new BlockPostData(35);
			data3.addBlock(340, -77, MoneyBonus);
			data3.addBlock(339, -161, MoneyBonus);
			data3.addBlock(341, -249, MoneyBonus);
			data3.addBlock(339, -341, MoneyBonus);
			data3.addBlock(68, -187, AmmoBonus);
			data3.addBlock(69, -279, AmmoBonus);
			lowLevel.push(data3);
			
			var data4:BlockPostData = new BlockPostData(35);
			data4.addBlock(339, -73, MoneyBonus);
			data4.addBlock(338, -149, MoneyBonus);
			data4.addBlock(338, -235, MoneyBonus);
			data4.addBlock(62, -274, MoneyBonus);
			data4.addBlock(158, -391, MoneyBonus);
			data4.addBlock(340, -320, MoneyBonus);
			lowLevel.push(data4);
			
			var data5:BlockPostData = new BlockPostData(35);
			data5.addBlock(155, -65, MoneyBonus);
			data5.addBlock(156, -149, MoneyBonus);
			data5.addBlock(155, -237, MoneyBonus);
			data5.addBlock(156, -328, MoneyBonus);
			data5.addBlock(65, -114, AmmoBonus);
			data5.addBlock(327, -237, PowerAmmo);
			lowLevel.push(data5);
			
			var data6:BlockPostData = new BlockPostData(35);
			data6.addBlock(238, -214, PowerReaction);
			data6.addBlock(216, -103, BricksEnemy);
			data6.addBlock(65, -66, MoneyBonus);
			data6.addBlock(64, -148, MoneyBonus);
			data6.addBlock(65, -242, MoneyBonus);
			data6.addBlock(133, -216, AntiTank);
			lowLevel.push(data6);
			
			var data7:BlockPostData = new BlockPostData(35);
			data7.addBlock(328, -132, PowerReaction);
			data7.addBlock(50, -123, PowerMoney);
			data7.addBlock(132, -100, AntiTank);
			data7.addBlock(229, -323, AntiTank);
			data7.addBlock(317, -323, AntiTank);
			data7.addBlock(41, -324, AntiTank);
			data7.addBlock(157, -304, MoneyBonus);
			data7.addBlock(157, -383, MoneyBonus);
			lowLevel.push(data7);
			
			var data8:BlockPostData = new BlockPostData(35);
			data8.addBlock(132, -327, AntiTank);
			data8.addBlock(227, -326, AntiTank);
			data8.addBlock(119, -163, BricksEnemy);
			data8.addBlock(215, -162, BricksEnemy);
			data8.addBlock(255, -223, AmmoBonus);
			lowLevel.push(data8);
			
			var data9:BlockPostData = new BlockPostData(25);
			data9.addBlock(140, -170, PitEnemy);
			data9.addBlock(235, -169, PitEnemy);
			lowLevel.push(data9);
			
			var data10:BlockPostData = new BlockPostData(35);
			data10.addBlock(42, -151, AntiTank);
			data10.addBlock(133, -356, AntiTank);
			data10.addBlock(227, -149, AntiTank);
			data10.addBlock(322, -335, PitEnemy);
			data10.addBlock(120, -136, BricksEnemy);
			lowLevel.push(data10);
			
			var data11:BlockPostData = new BlockPostData(35);
			data11.addBlock(119, -140, BricksEnemy);
			data11.addBlock(23, -286, BricksEnemy);
			data11.addBlock(214, -285, BricksEnemy);
			data11.addBlock(303, -138, BricksEnemy);
			data11.addBlock(316, -299, AntiTank);
			data11.addBlock(130, -443, AntiTank);
			data11.addBlock(40, -443, AntiTank);
			lowLevel.push(data11);
			
			var data12:BlockPostData = new BlockPostData(35);
			data12.addBlock(118, -127, BricksEnemy);
			data12.addBlock(120, -269, BricksEnemy);
			data12.addBlock(118, -410, BricksEnemy);
			data12.addBlock(227, -215, AntiTank);
			data12.addBlock(228, -416, AntiTank);
			data12.addBlock(317, -100, AntiTank);
			data12.addBlock(43, -96, AntiTank);
			data12.addBlock(42, -189, AntiTank);
			data12.addBlock(41, -287, AntiTank);
			lowLevel.push(data12);
			
			var data13:BlockPostData = new BlockPostData(35);
			data13.addBlock(40, -237, AntiTank);
			data13.addBlock(227, -237, AntiTank);
			data13.addBlock(320, -239, AntiTank);
			data13.addBlock(118, -86, BricksEnemy);
			data13.addBlock(139, -444, PitEnemy);
			lowLevel.push(data13);
			
			var data14:BlockPostData = new BlockPostData(35);
			data14.addBlock(121, -115, BricksEnemy);
			data14.addBlock(235, -306, PitEnemy);
			data14.addBlock(46, -487, PitEnemy);
			data14.addBlock(159, -228, AmmoBonus);
			lowLevel.push(data14);
			
			var data15:BlockPostData = new BlockPostData(35);
			data15.addBlock(135, -197, AntiTank);
			data15.addBlock(42, -298, AntiTank);
			data15.addBlock(133, -296, AntiTank);
			data15.addBlock(227, -296, AntiTank);
			data15.addBlock(311, -495, AntiTank);
			data15.addBlock(47, -443, PitEnemy);
			lowLevel.push(data15);
			
			var data16:BlockPostData = new BlockPostData(35);
			data16.addBlock(139, -141, PitEnemy);
			data16.addBlock(324, -141, PitEnemy);
			data16.addBlock(213, -209, BricksEnemy);
			data16.addBlock(26, -210, BricksEnemy);
			data16.addBlock(41, -351, AntiTank);
			data16.addBlock(229, -349, AntiTank);
			lowLevel.push(data16);
			
			var data17:BlockPostData = new BlockPostData(35);
			data17.addBlock(121, -139, BricksEnemy);
			data17.addBlock(237, -185, PitEnemy);
			data17.addBlock(134, -303, AntiTank);
			data17.addBlock(44, -302, AntiTank);
			data17.addBlock(42, -410, AntiTank);
			data17.addBlock(311, -427, AntiTank);
			data17.addBlock(215, -343, BricksEnemy);
			lowLevel.push(data17);
			
			var data18:BlockPostData = new BlockPostData(35);
			data18.addBlock(25, -124, BricksEnemy);
			data18.addBlock(118, -143, BricksEnemy);
			data18.addBlock(212, -110, BricksEnemy);
			data18.addBlock(304, -122, BricksEnemy);
			data18.addBlock(24, -273, BricksEnemy);
			data18.addBlock(215, -250, BricksEnemy);
			data18.addBlock(27, -395, BricksEnemy);
			data18.addBlock(117, -363, BricksEnemy);
			data18.addBlock(211, -380, BricksEnemy);
			data18.addBlock(305, -365, BricksEnemy);
			lowLevel.push(data18);
			
			var data19:BlockPostData = new BlockPostData(45);
			data19.addBlock(132, -128, AntiTank);
			data19.addBlock(44, -237, AntiTank);
			data19.addBlock(230, -127, AntiTank);
			data19.addBlock(232, -234, AntiTank);
			data19.addBlock(135, -551, AntiTank);
			data19.addBlock(214, -317, BricksEnemy);
			data19.addBlock(213, -413, BricksEnemy);
			data19.addBlock(160, -195, AmmoBonus);
			data19.addBlock(160, -271, AmmoBonus);
			data19.addBlock(160, -342, AmmoBonus);
			data19.addBlock(160, -420, AmmoBonus);
			data19.addBlock(43, -554, AntiTank);
			data19.addBlock(314, -550, AntiTank);
			lowLevel.push(data19);
		}
		
	}

}