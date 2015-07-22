package popups 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	import states.GameState;
	import states.MenuState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class EndWindow extends AntActor 
	{
		private var game:GameState;
		
		public function EndWindow(game:GameState) 
		{
			super();
			
			this.game = game;
			
			addAnimationFromCache("back_window_mc");
			
			x = AntG.stage.width / 2 - width / 2;
			y = -300;
			
			var menuBtn:AntButton = AntButton.makeButton("simple_button", "Menu", new AntLabel("system"));
			menuBtn.x = 180;
			menuBtn.y = this.height - menuBtn.height - 40;
			menuBtn.eventClick.add(onClickMenu);
			add(menuBtn);
		}
		
		public function show():void {
			var tween:AntTween = new AntTween(this, 1, AntTransition.EASE_OUT_ELASTIC);
			tween.moveTo(AntG.stage.width / 2 - width / 2, 150);
			tween.start();
		}
		
		private function onClickMenu(btn:AntButton):void 
		{
			//Main.stManager.switchWindow(MenuState);
			game.reset();
			
			var tween:AntTween = new AntTween(this, 0.2);
			tween.moveTo(AntG.stage.width / 2 - width / 2, -300);
			tween.start();
		}
		
	}

}