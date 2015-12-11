package states.upgrade 
{
	import flash.events.Event;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import user.Money;
	import user.UserData;
	
	/**
	 * ...
	 * @author ...
	 */
	public class UpgradePage extends AntEntity
	{
		private var reactionUp:AntEntity;
		private var moneyUp:AntEntity;
		private var bulletsUp:AntEntity;
		
		private var moneyLabel:AntLabel;
		private var ammoLabel:AntLabel;
		
		// стоимость снарядов в магазе
		private var costAmmunition:int = 500;
		
		public function UpgradePage() 
		{
			super();
			
			var img:AntActor = new AntActor();
			img.addAnimationFromCache(AssetLoader.ICON_MONEY);
			img.reset(0, 0);
			add(img);
			
			moneyLabel = new AntLabel("system", 24, 0xffffff);
			moneyLabel.text = UserData.money.money.toString();
			moneyLabel.reset(60, 0);
			add(moneyLabel);
			
			reactionUp = new UpgradeActor("Reaction Up", UserData.powers["powerReaction"]);
			reactionUp.reset(50, 60);
			add(reactionUp);
			
			moneyUp = new UpgradeActor("Money Up", UserData.powers["powerMoney"]);
			moneyUp.reset(50, 140);
			add(moneyUp);
			
			bulletsUp = new UpgradeActor("Bullets Up", UserData.powers["powerBullets"]);
			bulletsUp.reset(50, 220);
			add(bulletsUp);
			
			var ammoImg:AntActor = new AntActor();
			ammoImg.addAnimationFromCache(AssetLoader.AMMUNITION);
			ammoImg.reset(40, 290);
			add(ammoImg);
			
			var buyAmmunition:AntButton = AntButton.makeButton(AssetLoader.EMPTY_BUTTON, costAmmunition.toString(), new AntLabel("system", 14, 0x990000));
			buyAmmunition.reset(190, 320);
			add(buyAmmunition);
			buyAmmunition.eventClick.add(onClickBuyAmmunition);
			
			var ammoIcon:AntActor = new AntActor();
			ammoIcon.addAnimationFromCache(AssetLoader.ICON_AMMO);
			ammoIcon.reset(220, -20, 40);
			add(ammoIcon);
			
			ammoLabel = new AntLabel("system", 24);
			ammoLabel.reset(250, 0);
			ammoLabel.text = UserData.bullets.toString();
			add(ammoLabel);
			
			UserData.money.addEventListener(Money.CHANGE_BALANCE, onChangeBalance);
			
		}
		
		private function onClickBuyAmmunition(btn:AntButton):void 
		{
			if (UserData.money.money >= costAmmunition) {
				UserData.money.decMoney(costAmmunition);
				UserData.bullets += 3;
				UserData.save();
			}
		}
		
		override public function update():void 
		{
			super.update();
			moneyLabel.text = UserData.money.money.toString();
			ammoLabel.text = UserData.bullets.toString();
		}
		
		private function onChangeBalance(e:Event):void 
		{
			
			
		}
		
	}

}