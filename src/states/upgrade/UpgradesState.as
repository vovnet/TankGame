package states.upgrade 
{
	import flash.events.Event;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	import states.MenuState;
	import user.Money;
	import user.UserData;
	
	/**
	 * Окно с апгрейдами
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class UpgradesState extends AntState 
	{
		private var reactionUp:AntEntity;
		private var moneyUp:AntEntity;
		private var bulletsUp:AntEntity;
		
		private var moneyLabel:AntLabel;
		
		public function UpgradesState() 
		{
			super();
			
			reactionUp = new UpgradeActor("Reaction Up", UserData.powers["powerReaction"]);
			reactionUp.reset(140, 40);
			add(reactionUp);
			
			moneyUp = new UpgradeActor("Money Up", UserData.powers["powerMoney"]);
			moneyUp.reset(140, 120);
			add(moneyUp);
			
			bulletsUp = new UpgradeActor("Bullets Up", UserData.powers["powerBullets"]);
			bulletsUp.reset(140, 200);
			add(bulletsUp);
			
			moneyLabel = new AntLabel("system", 10, 0xffffff);
			moneyLabel.text = UserData.money.money.toString();
			add(moneyLabel);
			
			UserData.money.addEventListener(Money.CHANGE_BALANCE, onChangeBalance);
			
			var upgradesBtn:AntButton = AntButton.makeButton("simple_button", "Back", new AntLabel("system"));
			upgradesBtn.reset(AntG.width / 2 - upgradesBtn.width / 2, 450);
			upgradesBtn.useSystemCursor = false;
			add(upgradesBtn);
			upgradesBtn.eventClick.add(onClickBack);
		}
		
		private function onClickBack(btn:AntButton):void 
		{
			Main.stManager.switchWindow(MenuState);
		}
		
		override public function update():void 
		{
			super.update();
			moneyLabel.text = UserData.money.money.toString();
		}
		
		private function onChangeBalance(e:Event):void 
		{
			
			
		}
		
	}

}