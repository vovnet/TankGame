package states {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.awards.AwardsState;
	import states.upgrade.UpgradesState;
	import ui.SoundSwitcher;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MenuState extends AntState {
		private var logo:AntActor;
		
		override public function create():void {
			super.create();
			
			var background:AntActor = new AntActor();
			background.addAnimationFromCache(AssetLoader.MAIN_MENU_BACKGROUND);
			add(background);
			
			logo = new AntActor();
			logo.addAnimationFromCache(AssetLoader.LOGO);
			logo.reset(AntG.width / 2 - logo.width / 2, 150);
			add(logo);
			
			var logoButton:AntButton = AntButton.makeButton("sponsor_logo");
			logoButton.reset(10, 10);
			logoButton.soundOver = "clickSound";
			add(logoButton);
			logoButton.eventClick.add(onClickMoreGames);
			
			var startLabel:AntLabel = new AntLabel("foo", 34, 0xbc0f0f);
			startLabel.setStroke(0xf8de00);
			var startBtn:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "Start", startLabel);
			startBtn.reset(AntG.width / 2 - startBtn.width / 2, 400);
			startBtn.soundOver = "clickSound";
			add(startBtn);
			startBtn.eventClick.add(onClickStart);
			
			var awardsLabel:AntLabel = new AntLabel("foo", 20, 0xbc0f0f);
			awardsLabel.setStroke(0xf8de00);
			var awardsBtn:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "Achivements", awardsLabel);
			awardsBtn.reset(AntG.width / 2 - startBtn.width / 2, 450);
			awardsBtn.soundOver = "clickSound";
			add(awardsBtn);
			awardsBtn.eventClick.add(onClickAwards);
			
			var upgradesLabel:AntLabel = new AntLabel("foo", 26, 0xbc0f0f);
			upgradesLabel.setStroke(0xf8de00);
			var upgradesBtn:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "Upgrades", upgradesLabel);
			upgradesBtn.reset(AntG.width / 2 - startBtn.width / 2, 500);
			upgradesBtn.soundOver = "clickSound";
			add(upgradesBtn);
			upgradesBtn.eventClick.add(onClickUpgrade);
			
			var clearLabel:AntLabel = new AntLabel("foo", 26, 0xbc0f0f);
			clearLabel.setStroke(0xf8de00);
			var clearBtn:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "Reset", clearLabel);
			clearBtn.reset(326, -4);
			clearBtn.soundOver = "clickSound";
			add(clearBtn);
			clearBtn.eventClick.add(onClicReset);
			
			var soundButton:SoundSwitcher = new SoundSwitcher();
			soundButton.reset(6, 202);
			add(soundButton);
			
			var moreLabel:AntLabel = new AntLabel("foo", 21, 0xbc0f0f);
			moreLabel.setStroke(0xf8de00);
			var moreButton:AntButton = AntButton.makeButton(AssetLoader.SIMPLE_MENU_BUTTON, "More Games", moreLabel);
			moreButton.reset(AntG.width / 2 - startBtn.width / 2, 550);
			moreButton.soundOver = "clickSound";
			add(moreButton);
			moreButton.eventClick.add(onClickMoreGames);
		}
		
		private function onClickMoreGames(btn:AntButton):void {
			AntG.openUrl("http://8iz.com/");
		}
		
		override public function update():void {
			super.update();
			logo.y = 150 + (Math.cos(new Date().getTime() * 0.002) * 45);
		}
		
		private function onClickUpgrade(btn:AntButton):void {
			Main.stManager.switchWindow(UpgradesState);
		}
		
		private function onClicReset(btn:AntButton):void {
			AntStatistic.clearData();
			AntStatistic.saveData();
			UserData.clear();
		}
		
		private function onClickAwards(btn:AntButton):void {
			Main.stManager.switchWindow(AwardsState);
		}
		
		private function onClickStart(btn:AntButton):void {
			Main.stManager.switchWindow(GameState);
		}
	
	}

}