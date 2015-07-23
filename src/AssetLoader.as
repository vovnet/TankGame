package 
{
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntSoundManager;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AssetLoader 
	{
		[Embed(source = "../assets/img/bullet_view.png")]
		protected static var viewBulletUi:Class;
		
		[Embed(source = "../assets/img/ammo_bonus.png")]
		protected static var ammoBonus:Class;
		
		[Embed(source = "../assets/spritesheets/lines.png")]
		protected static var lines:Class;
		
		[Embed(source = "../assets/spritesheets/line.xml", mimeType = "application/octet-stream")]
		protected static var xmlLines:Class;
		
		[Embed(source = "../assets/spritesheets/enemies_sprite.png")]
		protected static var EnemiesSpriteSheet:Class;
		
		[Embed(source = "../assets/spritesheets/enemies.xml", mimeType = "application/octet-stream")]
		protected static var XmlEnemies:Class;
		
		[Embed(source="../assets/spritesheets/small_Buttons_Sprite.png")]
		protected static var SmallButtonsSheet:Class;
		
		[Embed(source="../assets/spritesheets/small_buttons.xml", mimeType = "application/octet-stream")]
		protected static var XmlSmallButtons:Class;
		
		[Embed(source = "../assets/img/background_summer.png")]
		protected static var BackgroundSummer:Class;
		
		[Embed(source = "../assets/img/emptySmallButton.png")]
		protected static var EmptySmallButton:Class;
		
		
		// ф-я обратного вызова по завершении загрузки графики
		private var callbackFunc:Function;
		
		public function AssetLoader() {
			
		}
		
		public function load(func:Function):void
		{
			this.callbackFunc = func;
			
			var loader:AntAssetLoader = new AntAssetLoader();
			
			// картинки
			loader.addGraphic(viewBulletUi, "bullet_ui");
			loader.addGraphic(ammoBonus, "ammo_bonus");
			loader.addGraphic(BackgroundSummer, "background_summer");
			loader.addGraphic(EmptySmallButton, "empty_small_button");
			loader.addClip(some_btn_mc, "simple_button");
			
			// мувиклипы
			loader.addClips(new <Class> [head_mc, hel_mc, tank_mc, pit_mc, brick_mc, 
				anti_tank_mc, bullet_mc, power_reaction_mc, back_window_mc, award_notice_mc, 
				award_001, award_002, award_003, award_004, award_005, award_block, tank_001, coin_mc
			]);
			
			// атласы
			loader.addAtlasA(lines, xmlLines, "linesAtlas");
			loader.addGraphicFromAtlas("linesAtlas", "linesUpgrade");
			loader.addAtlasA(EnemiesSpriteSheet, XmlEnemies, "enemiesAtlas");
			loader.addGraphicFromAtlas("enemiesAtlas", "x", "X");
			loader.addGraphicFromAtlas("enemiesAtlas", "rock", "rock");
			loader.addGraphicFromAtlas("enemiesAtlas", "pit", "pit");
			loader.addGraphicFromAtlas("enemiesAtlas", "mines", "mines");
			loader.addGraphicFromAtlas("enemiesAtlas", "money", "money");
			loader.addGraphicFromAtlas("enemiesAtlas", "iconMoney", "iconMoney");
			loader.addGraphicFromAtlas("enemiesAtlas", "ammo", "ammo");
			
			loader.addAtlasA(SmallButtonsSheet, XmlSmallButtons, "small_Buttons_Atlas");
			loader.addGraphicFromAtlas("small_Buttons_Atlas", "small_Button", "numBtn");
			
			
			// loading
			loader.eventComplete.add(onRasterize);
			loader.start();
		}
		
		private function onRasterize(loader:AntAssetLoader):void 
		{
			loader.destroy();
			
			callbackFunc();
		}
		
	}

}