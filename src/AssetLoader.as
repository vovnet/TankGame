package {
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntSoundManager;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AssetLoader {
		public static const TANK_01:String = "tank_01";
		public static const TANK_02:String = "tank_02";
		public static const TANK_03:String = "tank_03";
		public static const TANK_04:String = "tank_04";
		public static const TANK_05:String = "tank_05";
		
		[Embed(source="../assets/spritesheets/tanks_atlas.png")]
		protected static var SpritesheetTanks:Class;
		
		[Embed(source="../assets/spritesheets/tanks_atlas.xml",mimeType="application/octet-stream")]
		protected static var XmlTanks:Class;
		
		[Embed(source="../assets/fonts/foo.ttf",fontFamily="foo",embedAsCFF="false")]
		protected var jank1:String;
		
		public static const SIMPLE_MENU_BUTTON:String = "simple menu button";
		[Embed(source="../assets/img/simple_menu_button.png")]
		protected static var SimpleMenuButtonEmbed:Class;
		
		///////////////////////////////////////////////
		
		public static const START_BUTTON:String = "start_button_1";
		public static const ACIVEMENTS_BUTTON:String = "acivements_button_1";
		public static const BACK_BUTTON:String = "back_button_1";
		public static const CLEAR_BUTTON:String = "clear_button_1";
		public static const EMPTY_BUTTON:String = "empty_button_1";
		public static const UPGRADES_BUTTON:String = "upgrades_button_1";
		// circles
		public static const ACIVEMENTS_CIRCLE_BUTTON:String = "acivements_circle_button_1";
		public static const MENU_CIRCLE_BUTTON:String = "menu_circle_button_1";
		public static const PAUSE_CIRCLE_BUTTON:String = "pause_circle_button_1";
		public static const PLAY_CIRCLE_BUTTON:String = "play_circle_button_1";
		public static const REPLAY_CIRCLE_BUTTON:String = "replay_circle_button_1";
		public static const SOUND_OFF_CIRCLE_BUTTON:String = "sound_off_circle_button_1";
		public static const SOUND_ON_CIRCLE_BUTTON:String = "sound_on_circle_button_1";
		public static const TWITTER_CIRCLE_BUTTON:String = "twitter_circle_button_1";
		
		[Embed(source="../assets/spritesheets/spritesheet_buttons.png")]
		protected static var SpritesheetButtons:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_buttons.xml",mimeType="application/octet-stream")]
		protected static var XmlButtons:Class;
		
		///////////////////////////////////////////////
		public static const BACK_UPGRADE_ACHIV:String = "back_up_ach";
		[Embed(source="../assets/img/back.jpg")]
		protected static var BackUpgradeAchiv:Class;
		
		///////////////////////////////////////////////
		
		public static const AMMO_BONUS:String = "ammo";
		
		[Embed(source="../assets/spritesheets/spritesheet_ammo.png")]
		protected static var SpritesheetAmmoBonus:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_ammo.xml",mimeType="application/octet-stream")]
		protected static var XmlAmmoBonus:Class;
		
		///////////////////////////////////////////////
		
		public static const MONEY_BONUS:String = "money";
		
		[Embed(source="../assets/spritesheets/spritesheet_coin.png")]
		protected static var SpritesheetCoinBonus:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_coin.xml",mimeType="application/octet-stream")]
		protected static var XmlCoinBonus:Class;
		
		///////////////////////////////////////////////
		
		public static const UPDATE_LINES:String = "update_lines";
		
		[Embed(source="../assets/spritesheets/spritesheet_lines.png")]
		protected static var SpritesheetUpdateLines:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_lines.xml",mimeType="application/octet-stream")]
		protected static var XmlUpdateLines:Class;
		
		///////////////////////////////////////////////
		
		// main menu background
		public static const MAIN_MENU_BACKGROUND:String = "main_menu_background";
		[Embed(source="../assets/img/main_background.png")]
		protected static var MainMenuBackground:Class;
		
		// logo
		public static const LOGO:String = "logo";
		[Embed(source="../assets/img/logo.png")]
		protected static var SpriteLogo:Class;
		///////////////////////////////////////////////
		
		// reaction powerup
		public static const REACTION_POWERUP:String = "reaction_powerup";
		
		[Embed(source="../assets/spritesheets/spritesheet_reaction_bonus.png")]
		protected static var SpritesheetReactionPowerup:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_reaction_bonus.xml",mimeType="application/octet-stream")]
		protected static var XmlReactionPowerup:Class;
		
		///////////////////////////////////////////////
		
		// money powerup
		public static const MONEY_POWERUP:String = "money_powerup";
		
		[Embed(source="../assets/spritesheets/spritesheet_money_powerup.png")]
		protected static var SpritesheetMoneyPowerup:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_money_powerup.xml",mimeType="application/octet-stream")]
		protected static var XmlMoneyPowerup:Class;
		
		///////////////////////////////////////////////
		
		// ammo powerup
		public static const AMMO_POWERUP:String = "ammo_powerup";
		
		[Embed(source="../assets/spritesheets/spritesheet_ammo_bonus.png")]
		protected static var SpritesheetAmmoPowerup:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_ammo_bonus.xml",mimeType="application/octet-stream")]
		protected static var XmlAmmoPowerup:Class;
		
		///////////////////////////////////////////////
		
		// enemies
		public static const ENEMY_CAR:String = "enemy_car";
		public static const ENEMY_HATCH:String = "enemy_hatch";
		public static const ENEMY_ANTI:String = "enemy_anti";
		public static const ENEMY_MINE:String = "enemy_mine";
		
		[Embed(source="../assets/spritesheets/spritesheet_enemies.png")]
		protected static var SpritesheetEnemies:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_enemies.xml",mimeType="application/octet-stream")]
		protected static var XmlEnemies:Class;
		
		///////////////////////////////////////////////
		
		// icons
		public static const ICON_AMMO:String = "ammo_icon";
		public static const ICON_MONEY:String = "icon_money";
		public static const ICON_AMMO_BONUS:String = "ammo_icon_bonus";
		public static const ICON_MONEY_BONUS:String = "icon_money_bonus";
		public static const ICON_REACTION_BONUS:String = "icon_reaction_bonus";
		public static const ICON_INACTIVE_BOX:String = "icon_inactive_box";
		public static const ICON_ACTIVE_BOX:String = "icon_active_box";
		public static const ICON_PLAX:String = "icon_plax";
		
		[Embed(source="../assets/spritesheets/spritesheet_icons.png")]
		protected static var SpritesheetIcons:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_icons.xml",mimeType="application/octet-stream")]
		protected static var XmlIcons:Class;
		
		///////////////////////////////////////////////
		// the end window
		public static const THE_END_WINDOW:String = "the_end_window";
		
		[Embed(source="../assets/img/the_end.png")]
		protected static var TheEndEmbed:Class;
		
		///////////////////////////////////////////////
		
		// skins
		public static const SKIN_1:String = "skin_1";
		public static const SKIN_2:String = "skin_2";
		public static const SKIN_3:String = "skin_3";
		public static const SKIN_4:String = "skin_4";
		public static const SKIN_5:String = "skin_5";
		
		[Embed(source="../assets/img/skin_tanks/skin_1.png")]
		protected static var SpriteSkin1:Class;
		[Embed(source="../assets/img/skin_tanks/skin_2.png")]
		protected static var SpriteSkin2:Class;
		[Embed(source="../assets/img/skin_tanks/skin_3.png")]
		protected static var SpriteSkin3:Class;
		[Embed(source="../assets/img/skin_tanks/skin_4.png")]
		protected static var SpriteSkin4:Class;
		[Embed(source="../assets/img/skin_tanks/skin_5.png")]
		protected static var SpriteSkin5:Class;
		
		///////////////////////////////////////////////
		// explotion
		public static const EXPLOTION:String = "explotion";
		
		[Embed(source="../assets/spritesheets/spritesheet_explotion.png")]
		protected static var SpritesheetExplotion:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_explotion.xml",mimeType="application/octet-stream")]
		protected static var XmlExplotion:Class;
		
		///////////////////////////////////////////////
		// аммуниция для покупки в магазе
		public static const AMMUNITION:String = "ammunition";
		[Embed(source="../assets/img/ammunition_small.png")]
		protected static var SpriteAmmunition:Class;
		
		///////////////////////////////////////////////
		// speed up!
		public static const SPEED_UP:String = "speed_up";
		
		[Embed(source="../assets/spritesheets/spritesheet_speed_up.png")]
		protected static var SpritesheetSpeedUp:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_speed_up.xml",mimeType="application/octet-stream")]
		protected static var XmlSpeedUp:Class;
		
		///////////////////////////////////////////////
		// awards
		public static const AWARD_COLLECTOR_1:String = "award_collector_1";
		public static const AWARD_COLLECTOR_2:String = "award_collector_2";
		public static const AWARD_DEAD_1:String = "award_dead_1";
		public static const AWARD_DEAD_2:String = "award_dead_2";
		public static const AWARD_DEAD_3:String = "award_dead_3";
		public static const AWARD_DEAD_4:String = "award_dead_4";
		public static const AWARD_DEAD_5:String = "award_dead_5";
		public static const AWARD_DEAD_6:String = "award_dead_6";
		public static const AWARD_DRIVER_1:String = "award_driver_1";
		public static const AWARD_DRIVER_2:String = "award_driver_2";
		public static const AWARD_DRIVER_3:String = "award_driver_3";
		public static const AWARD_DRIVER_4:String = "award_driver_4";
		public static const AWARD_DRIVER_5:String = "award_driver_5";
		public static const AWARD_KILLS_1:String = "award_kills_1";
		public static const AWARD_KILLS_2:String = "award_kills_2";
		public static const AWARD_KILLS_3:String = "award_kills_3";
		public static const AWARD_KILLS_4:String = "award_kills_4";
		public static const AWARD_KILLS_5:String = "award_kills_5";
		public static const AWARD_KILLS_6:String = "award_kills_6";
		public static const AWARD_MONEY_EARN_1:String = "award_money_earn_1";
		public static const AWARD_MONEY_EARN_2:String = "award_money_earn_2";
		public static const AWARD_MONEY_EARN_3:String = "award_money_earn_3";
		public static const AWARD_MONEY_EARN_4:String = "award_money_earn_4";
		public static const AWARD_MONEY_EARN_5:String = "award_money_earn_5";
		public static const AWARD_MONEY_SPEND_1:String = "award_money_spend_1";
		public static const AWARD_MONEY_SPEND_2:String = "award_money_spend_2";
		public static const AWARD_MONEY_SPEND_3:String = "award_money_spend_3";
		public static const AWARD_MONEY_SPEND_4:String = "award_money_spend_4";
		public static const AWARD_MONEY_SPEND_5:String = "award_money_spend_5";
		public static const AWARD_LOCK:String = "award_lock";
		
		[Embed(source="../assets/spritesheets/spritesheet_awards.png")]
		protected static var SpritesheetAwards:Class;
		
		[Embed(source="../assets/spritesheets/spritesheet_awards.xml",mimeType="application/octet-stream")]
		protected static var XmlAwards:Class;
		
		///////////////////////////////////////////////
		
		[Embed(source="../assets/img/bullet_view.png")]
		protected static var viewBulletUi:Class;
		
		//[Embed(source = "../assets/img/ammo_bonus.png")]
		protected static var ammoBonus:Class;
		
		[Embed(source="../assets/spritesheets/lines.png")]
		protected static var lines:Class;
		
		[Embed(source="../assets/spritesheets/line.xml",mimeType="application/octet-stream")]
		protected static var xmlLines:Class;
		
		[Embed(source="../assets/spritesheets/enemies_sprite.png")]
		protected static var EnemiesSpriteSheet:Class;
		
		[Embed(source="../assets/spritesheets/enemies.xml",mimeType="application/octet-stream")]
		protected static var XmlEnemies2:Class;
		
		[Embed(source="../assets/spritesheets/small_Buttons_Sprite.png")]
		protected static var SmallButtonsSheet:Class;
		
		[Embed(source="../assets/spritesheets/small_buttons.xml",mimeType="application/octet-stream")]
		protected static var XmlSmallButtons:Class;
		
		[Embed(source="../assets/img/road_background_1.png")]
		protected static var BackgroundSummer:Class;
		
		[Embed(source="../assets/img/emptySmallButton.png")]
		protected static var EmptySmallButton:Class;
		
		//[Embed(source = "../assets/img/wheel_sl.png")]
		protected static var WheelSled:Class;
		
		[Embed(source="../assets/img/pause_back.png")]
		protected static var PauseBackground:Class;
		
		// instruction
		[Embed(source = "../assets/spritesheets/instruction_spritesheet.png")]
		protected static var InstructionSpritesheet:Class;
		[Embed(source = "../assets/spritesheets/instruction_spritesheet.xml",mimeType="application/octet-stream")]
		protected static var XmlInstruction:Class;
		public static var INSTRUCT_CONTROL:String = "instruction control";
		public static var INSTRUCT_SHOT:String = "instruction shot";
		public static var INSTRUCT_RESTART:String = "instruction restart";
		
		// sponsor
		[Embed(source = "../assets/sponsor/8izlogo.png")]
		protected static var SponsorLogoEmbed:Class;
		
		// ф-я обратного вызова по завершении загрузки графики
		private var callbackFunc:Function;
		
		public function AssetLoader() {
		
		}
		
		public function load(func:Function):void {
			this.callbackFunc = func;
			
			var loader:AntAssetLoader = new AntAssetLoader();
			
			// картинки
			//loader.addGraphic(viewBulletUi, "bullet_ui");
			//loader.addGraphic(ammoBonus, "ammo_bonus");
			loader.addGraphic(BackgroundSummer, "background_summer");
			loader.addGraphic(EmptySmallButton, "empty_small_button");
			loader.addClip(some_btn_mc, "simple_button");
			loader.addGraphic(PauseBackground, "pause_background");
			loader.addGraphic(SimpleMenuButtonEmbed, SIMPLE_MENU_BUTTON);
			
			loader.addGraphic(SpriteAmmunition, AMMUNITION);
			
			// main menu background
			loader.addGraphic(MainMenuBackground, MAIN_MENU_BACKGROUND);
			
			// the end window
			loader.addGraphic(TheEndEmbed, THE_END_WINDOW);
			
			// мувиклипы
			loader.addClips(new <Class>[head_mc, hel_mc, tank_mc, pit_mc, brick_mc, anti_tank_mc, bullet_mc, power_reaction_mc, back_window_mc, award_notice_mc, award_001, award_002, award_003, award_004, award_005, award_block, tank_001, coin_mc]);
			
			loader.addAtlasA(SmallButtonsSheet, XmlSmallButtons, "small_Buttons_Atlas");
			loader.addGraphicFromAtlas("small_Buttons_Atlas", "small_Button", "numBtn");
			
			loader.addGraphic(SpriteLogo, LOGO);
			loader.addGraphic(BackUpgradeAchiv, BACK_UPGRADE_ACHIV);
			
			// load tanks
			loader.addAtlasA(SpritesheetTanks, XmlTanks, "AntTanksAtlas");
			loader.addGraphicFromAtlas("AntTanksAtlas", TANK_01, "tank2");
			loader.addGraphicFromAtlas("AntTanksAtlas", TANK_02, "tank3");
			loader.addGraphicFromAtlas("AntTanksAtlas", TANK_03, "tank1");
			loader.addGraphicFromAtlas("AntTanksAtlas", TANK_04, "tank5");
			loader.addGraphicFromAtlas("AntTanksAtlas", TANK_05, "tank4");
			
			// load awards
			loader.addAtlasA(SpritesheetAwards, XmlAwards, "AntAwardAtlas");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_COLLECTOR_1, "collector_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_COLLECTOR_2, "collector_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_1, "dead_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_2, "dead_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_3, "dead_03");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_4, "dead_04");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_5, "dead_05");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DEAD_6, "dead_06");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DRIVER_1, "driver_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DRIVER_2, "driver_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DRIVER_3, "driver_03");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DRIVER_4, "driver_04");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_DRIVER_5, "driver_05");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_1, "kills_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_2, "kills_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_3, "kills_03");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_4, "kills_04");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_5, "kills_05");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_KILLS_6, "kills_06");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_LOCK, "locked");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_EARN_1, "money_earn_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_EARN_2, "money_earn_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_EARN_3, "money_earn_03");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_EARN_4, "money_earn_04");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_EARN_5, "money_earn_05");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_SPEND_1, "money_spend_01");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_SPEND_2, "money_spend_02");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_SPEND_3, "money_spend_03");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_SPEND_4, "money_spend_04");
			loader.addGraphicFromAtlas("AntAwardAtlas", AWARD_MONEY_SPEND_5, "money_spend_05");
			
			// load ammo bonus
			loader.addAtlasA(SpritesheetAmmoBonus, XmlAmmoBonus, "AntAmmoBonusAtlas");
			loader.addGraphicFromAtlas("AntAmmoBonusAtlas", AMMO_BONUS, "ammo");
			
			// load coin bonus
			loader.addAtlasA(SpritesheetCoinBonus, XmlCoinBonus, "AntCoinBonusAtlas");
			loader.addGraphicFromAtlas("AntCoinBonusAtlas", MONEY_BONUS, "coin");
			
			// reaction powerup
			loader.addAtlasA(SpritesheetReactionPowerup, XmlReactionPowerup, "AntReactionPowerupAtlas");
			loader.addGraphicFromAtlas("AntReactionPowerupAtlas", REACTION_POWERUP, "reaction_bonus");
			
			// load explotion
			loader.addAtlasA(SpritesheetExplotion, XmlExplotion, "AntExplotionAtlas");
			loader.addGraphicFromAtlas("AntExplotionAtlas", EXPLOTION);
			
			// money powerup
			loader.addAtlasA(SpritesheetMoneyPowerup, XmlMoneyPowerup, "AntMoneyPowerupAtlas");
			loader.addGraphicFromAtlas("AntMoneyPowerupAtlas", MONEY_POWERUP, "money_powerup");
			
			// ammo powerup
			loader.addAtlasA(SpritesheetAmmoPowerup, XmlAmmoPowerup, "AntAmmoPowerupAtlas");
			loader.addGraphicFromAtlas("AntAmmoPowerupAtlas", AMMO_POWERUP, "ammo_bonus");
			
			// speed up
			loader.addAtlasA(SpritesheetSpeedUp, XmlSpeedUp, "AntSpeedUpAtlas");
			loader.addGraphicFromAtlas("AntSpeedUpAtlas", SPEED_UP, "speed_up");
			
			// load buttons
			loader.addAtlasA(SpritesheetButtons, XmlButtons, "AntButtonsAtlas");
			loader.addGraphicFromAtlas("AntButtonsAtlas", START_BUTTON, "start_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", ACIVEMENTS_BUTTON, "achiv_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", ACIVEMENTS_CIRCLE_BUTTON, "achiv_circle_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", BACK_BUTTON, "back_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", CLEAR_BUTTON, "clear_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", EMPTY_BUTTON, "empty_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", UPGRADES_BUTTON, "upgrade_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", MENU_CIRCLE_BUTTON, "menu_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", PAUSE_CIRCLE_BUTTON, "pause_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", PLAY_CIRCLE_BUTTON, "play_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", REPLAY_CIRCLE_BUTTON, "replay_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", SOUND_OFF_CIRCLE_BUTTON, "sound_off_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", SOUND_ON_CIRCLE_BUTTON, "sound_on_button");
			loader.addGraphicFromAtlas("AntButtonsAtlas", TWITTER_CIRCLE_BUTTON, "twet_button");
			
			// load instruction
			loader.addAtlasA(InstructionSpritesheet, XmlInstruction, "AntInstructionAtlas");
			loader.addGraphicFromAtlas("AntInstructionAtlas", INSTRUCT_CONTROL, "instruction_control");
			loader.addGraphicFromAtlas("AntInstructionAtlas", INSTRUCT_SHOT, "instruction_shot");
			loader.addGraphicFromAtlas("AntInstructionAtlas", INSTRUCT_RESTART, "instruction_restart");
			
			// load upgrade lines
			loader.addAtlasA(SpritesheetUpdateLines, XmlUpdateLines, "AntUpdateLines");
			loader.addGraphicFromAtlas("AntUpdateLines", UPDATE_LINES);
			
			// load enemies
			loader.addAtlasA(SpritesheetEnemies, XmlEnemies, "AntEnemiesAtlas");
			loader.addGraphicFromAtlas("AntEnemiesAtlas", ENEMY_ANTI, "anti");
			loader.addGraphicFromAtlas("AntEnemiesAtlas", ENEMY_CAR, "car");
			loader.addGraphicFromAtlas("AntEnemiesAtlas", ENEMY_HATCH, "hatch");
			loader.addGraphicFromAtlas("AntEnemiesAtlas", ENEMY_MINE, "mine");
			
			// load icons
			loader.addAtlasA(SpritesheetIcons, XmlIcons, "AntIconsAtlas");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_AMMO, "ammo_icon");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_AMMO_BONUS, "icon_ammo_bonus");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_MONEY_BONUS, "icon_money_bonus");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_REACTION_BONUS, "icon_reaction_bonus");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_MONEY, "money_icon");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_INACTIVE_BOX, "num1");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_ACTIVE_BOX, "num2");
			loader.addGraphicFromAtlas("AntIconsAtlas", ICON_PLAX, "plax");
			
			// load skins
			loader.addGraphic(SpriteSkin1, SKIN_1);
			loader.addGraphic(SpriteSkin2, SKIN_2);
			loader.addGraphic(SpriteSkin3, SKIN_3);
			loader.addGraphic(SpriteSkin4, SKIN_4);
			loader.addGraphic(SpriteSkin5, SKIN_5);
			
			// sponsor
			loader.addGraphic(SponsorLogoEmbed, "sponsor_logo");
			
			// loading
			loader.eventComplete.add(onRasterize);
			loader.start();
		}
		
		private function onRasterize(loader:AntAssetLoader):void {
			loader.destroy();
			callbackFunc();
		}
	
	}

}