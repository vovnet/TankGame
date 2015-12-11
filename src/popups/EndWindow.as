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
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class EndWindow extends AntActor {
		public static const linkForGame:String = "www.8iz.com";
		
		private var game:GameState;
		private var distance:Number = 0;
		private var label:AntLabel;
		
		public function EndWindow(game:GameState) {
			super();
			
			this.game = game;
			
			addAnimationFromCache(AssetLoader.THE_END_WINDOW);
			
			x = AntG.stage.width / 2 - width / 2;
			y = -300;
			
			var resetBtn:AntButton = AntButton.makeButton(AssetLoader.REPLAY_CIRCLE_BUTTON);
			resetBtn.reset(20, 70);
			resetBtn.eventClick.add(onClickReset);
			add(resetBtn);
			
			var menuBtn:AntButton = AntButton.makeButton(AssetLoader.MENU_CIRCLE_BUTTON);
			menuBtn.reset(80, 70);
			menuBtn.eventClick.add(onClickMenu);
			add(menuBtn);
			
			var soundBtn:SoundSwitcher = new SoundSwitcher();
			soundBtn.reset(140, 70);
			add(soundBtn);
			
			var twetterBtn:AntButton = AntButton.makeButton(AssetLoader.TWITTER_CIRCLE_BUTTON);
			twetterBtn.reset(204, 70);
			add(twetterBtn);
			twetterBtn.eventClick.add(onTwetterClick);
			
			label = new AntLabel("system", 16, 0xffffff);
			label.width = 250;
			label.align = AntLabel.CENTER;
			label.text = "Distance: " + distance.toString() + " m";
			label.reset(30, 24);
			add(label);
			
			var moreLabel:AntLabel = new AntLabel("foo", 16, 0xbc0f0f);
			moreLabel.setStroke(0xf8de00);
			var moreGames:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "Play more games", moreLabel);
			moreGames.reset(this.width / 2 - moreGames.width / 2, 150);
			add(moreGames);
			moreGames.soundOver = "clickSound";
			moreGames.eventClick.add(onClickMoreGames);
		}
		
		private function onClickMoreGames(btn:AntButton):void {
			AntG.openUrl("http://8iz.com/");
		}
		
		override public function update():void {
			super.update();
			if (AntG.keys.isPressed("R")) {
				onClickReset(null);
			}
		}
		
		private function onTwetterClick(btn:AntButton):void {
			AntG.openUrl("https://twitter.com/intent/tweet?text=My record in the game RushOfTanks: " + distance + " meters! Play here: " + linkForGame);
		}
		
		public function show(distance:Number):void {
			this.distance = distance;
			label.text = "Distance: " + distance.toString() + " m";
			
			var tween:AntTween = new AntTween(this, 1, AntTransition.EASE_OUT_ELASTIC);
			tween.moveTo(AntG.stage.width / 2 - width / 2, 200);
			tween.start();
		}
		
		private function onClickMenu(btn:AntButton):void {
			Main.stManager.switchWindow(MenuState);
		}
		
		private function onClickReset(btn:AntButton):void {
			game.reset();
			
			var tween:AntTween = new AntTween(this, 0.2);
			tween.moveTo(AntG.stage.width / 2 - width / 2, -300);
			tween.start();
		}
	
	}

}