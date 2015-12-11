package ui 
{
	import flash.events.Event;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SoundSwitcher extends AntActor 
	{
		private var soundOff:AntButton;
		private var soundOn:AntButton;
		
		public function SoundSwitcher() 
		{
			super();
			
			soundOff = AntButton.makeButton(AssetLoader.SOUND_OFF_CIRCLE_BUTTON);
			soundOn = AntButton.makeButton(AssetLoader.SOUND_ON_CIRCLE_BUTTON);
			soundOn.soundOver = "clickSound";
			add(soundOff);
			add(soundOn);
			
			if (AntG.sounds.mute) {
				soundOff.visible = true;
				soundOn.visible = false;
			} else {
				soundOff.visible = false;
				soundOn.visible = true;
			}
			
			soundOff.eventClick.add(onClickOff);
			soundOn.eventClick.add(onClickOn);
		}
		
		/**
		 * Включаем звук
		 */
		private function onClickOff(btn:AntButton):void 
		{
			AntG.sounds.mute = false;
			soundOff.visible = false;
			soundOn.visible = true;
			AntG.sounds.resume();
		}
		
		/**
		 * Выключаем звук
		 * @param	btn
		 */
		private function onClickOn(btn:AntButton):void 
		{
			AntG.sounds.mute = true;
			soundOff.visible = true;
			soundOn.visible = false;
			AntG.sounds.pause();
		}
		
	}

}