package states 
{
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMask;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.awards.AwardsState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MenuState extends AntState 
	{
		
		public function MenuState() 
		{
			super();
			
		}
		
		override public function create():void 
		{
			super.create();
			
			var startBtn:AntButton = AntButton.makeButton("simple_button", "Start", new AntLabel("system"));
			startBtn.reset(AntG.width / 2 - startBtn.width / 2, 200);
			startBtn.useSystemCursor = false;
			add(startBtn);
			startBtn.eventClick.add(onClickStart);
			
			var awardsBtn:AntButton = AntButton.makeButton("simple_button", "Achivements", new AntLabel("system"));
			awardsBtn.reset(AntG.width / 2 - awardsBtn.width / 2, 260);
			awardsBtn.useSystemCursor = false;
			add(awardsBtn);
			awardsBtn.eventClick.add(onClickAwards);
			
			var clearBtn:AntButton = AntButton.makeButton("simple_button", "Clear", new AntLabel("system"));
			clearBtn.reset(AntG.width / 2 - clearBtn.width / 2, 420);
			clearBtn.useSystemCursor = false;
			add(clearBtn);
			clearBtn.eventClick.add(onClicReset);
			
			var upgradesBtn:AntButton = AntButton.makeButton("simple_button", "Upgrades", new AntLabel("system"));
			upgradesBtn.reset(AntG.width / 2 - upgradesBtn.width / 2, 300);
			upgradesBtn.useSystemCursor = false;
			add(upgradesBtn);
			upgradesBtn.eventClick.add(onClickUpgrade);
		}
		
		private function onClickUpgrade(btn:AntButton):void 
		{
			AntG.switchState(new UpgradesState);
		}
		
		private function onClicReset(btn:AntButton):void 
		{
			AntStatistic.clearData();
			AntStatistic.saveData();
			UserData.clear();
		}
		
		private function onClickAwards(btn:AntButton):void 
		{
			AntG.switchState(new AwardsState);
			
		}
		
		private function onClickStart(btn:AntButton):void 
		{
			AntG.switchState(new GameState);
		}
		
		
		
	}

}