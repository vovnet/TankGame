package popups {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	import states.GameState;
	import states.MenuState;
	import ui.SoundSwitcher;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PauseWindow extends AntActor {
		
		public function PauseWindow() {
			super();
			
			addAnimationFromCache("pause_background");
			
			x = AntG.stage.width / 2 - width / 2;
			y = -300;
			
			var txt:AntLabel = new AntLabel("system", 16, 0xffffff);
			txt.text = "[P]-Pause";
			txt.wordWrap = true;
			txt.setSize(300, 200);
			txt.align = AntLabel.CENTER;
			txt.highlightText("меню", 0xff0000);
			txt.x = this.width / 2 - txt.width / 2;
			txt.y = 14;
			add(txt);
			
			var resumeBtn:AntButton = AntButton.makeButton(AssetLoader.PLAY_CIRCLE_BUTTON);
			resumeBtn.reset(14, 50);
			resumeBtn.eventClick.add(onClickResume);
			add(resumeBtn);
			
			var menuBtn:AntButton = AntButton.makeButton(AssetLoader.MENU_CIRCLE_BUTTON);
			menuBtn.reset(86, 50);
			menuBtn.useSystemCursor = false;
			add(menuBtn);
			menuBtn.eventClick.add(onClickMenu);
			
			var soundButton:SoundSwitcher = new SoundSwitcher();
			soundButton.reset(158, 50);
			add(soundButton);
			
			user.UserData.save();
		}
		
		public function show():void {
			var tween:AntTween = new AntTween(this, 0.5, AntTransition.EASE_OUT_ELASTIC);
			tween.moveTo(AntG.stage.width / 2 - width / 2, 200);
			tween.start();
		}
		
		public function hide():void {
			onClickResume(null);
		}
		
		private function onClickMenu(btn:AntButton):void {
			Main.stManager.switchWindow(MenuState);
		}
		
		private function onClickResume(btn:AntButton):void {
			var tween:AntTween = new AntTween(this, 0.2);
			tween.moveTo(AntG.stage.width / 2 - width / 2, -300);
			tween.start();
			GameState.isPause = false;
		}
	
	}

}