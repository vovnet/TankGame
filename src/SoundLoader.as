package 
{
	import ru.antkarlov.anthill.AntG;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class SoundLoader 
	{
		[Embed(source = "../assets/sounds/Click_sounds_Main_Metal_medium_02.mp3")]
		private static var ClickSoundEmbed:Class;
		
		[Embed(source = "../assets/sounds/Click_sounds_Main_Metal_big_02.mp3")]
		private static var ShtoreCloseSoundEmbed:Class;
		
		[Embed(source = "../assets/sounds/add_bonus.mp3")]
		private static var AddBonusEmbed:Class;
		
		[Embed(source = "../assets/sounds/shoot.mp3")]
		private static var ShootSoundEmbed:Class;
		
		[Embed(source = "../assets/sounds/melody.mp3")]
		private static var Melody:Class;
		
		[Embed(source = "../assets/sounds/reload.mp3")]
		private static var ReloadSoundEmbed:Class;
		
		[Embed(source = "../assets/sounds/exp.mp3")]
		private static var ExplotionSoundEmbed:Class;
		
		[Embed(source = "../assets/sounds/bonus.mp3")]
		private static var BonusSoundEmbed:Class;
		
		public static function load():void
		{
			AntG.sounds.addEmbedded(ClickSoundEmbed, "clickSound");
			AntG.sounds.addEmbedded(ShtoreCloseSoundEmbed, "shtoreCloseSound");
			AntG.sounds.addEmbedded(AddBonusEmbed, "addBonus");
			AntG.sounds.addEmbedded(ShootSoundEmbed, "shootSound");
			AntG.sounds.addEmbedded(Melody, "melody");
			AntG.sounds.addEmbedded(ReloadSoundEmbed, "reload");
			AntG.sounds.addEmbedded(ExplotionSoundEmbed, "explotion");
			AntG.sounds.addEmbedded(BonusSoundEmbed, "bonus");
		}
		
	}

}