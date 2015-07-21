package 
{
	import ru.antkarlov.anthill.AntAssetLoader;
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
			loader.addClip(some_btn_mc, "simple_button");
			
			// мувиклипы
			loader.addClips(new <Class> [head_mc, hel_mc, tank_mc, pit_mc, brick_mc, 
				anti_tank_mc, bullet_mc, power_reaction_mc, back_window_mc, award_notice_mc, 
				award_001, award_002, award_003, award_004, award_005, award_block, tank_001, coin_mc
			]);
			
			// атласы
			loader.addAtlasA(lines, xmlLines, "linesAtlas");
			loader.addGraphicFromAtlas("linesAtlas", "linesUpgrade");
			
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