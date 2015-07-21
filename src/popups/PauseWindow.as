package popups 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import states.GameState;
	import states.MenuState;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PauseWindow extends AntActor 
	{
		
		public function PauseWindow() 
		{
			super();
			
			addAnimationFromCache("back_window_mc");
			
			var txt:AntLabel = new AntLabel("system", 10, 0x555555);
			txt.text = "Меню паузы";
			txt.wordWrap = true;
			txt.setSize(300, 200);
			txt.align = AntLabel.CENTER;
			txt.highlightText("меню", 0xff0000);
			txt.x = this.width / 2 - txt.width / 2;
			txt.y = 50;
			add(txt);
			
			var resumeBtn:AntButton = AntButton.makeButton("simple_button", "Resume", new AntLabel("system"));
			resumeBtn.x = 180;
			resumeBtn.y = this.height - resumeBtn.height - 40;
			resumeBtn.eventClick.add(onClickResume);
			add(resumeBtn);
			
			var menuBtn:AntButton = AntButton.makeButton("simple_button", "Menu", new AntLabel("system"));
			menuBtn.reset(60, this.height - menuBtn.height - 40);
			menuBtn.useSystemCursor = false;
			add(menuBtn);
			menuBtn.eventClick.add(onClickMenu);
			
			user.UserData.save();
		}
		
		private function onClickMenu(btn:AntButton):void 
		{
			Main.stManager.switchWindow(MenuState);
		}
		
		private function onClickResume(btn:AntButton):void 
		{
			parent.remove(this);
			GameState.isPause = false;
		}
		
	}

}