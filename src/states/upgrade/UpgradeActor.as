package states.upgrade 
{
	import flash.events.Event;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntLabel;
	import user.Money;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class UpgradeActor extends AntActor 
	{
		private var title:AntLabel;
		private var view:AntActor;
		private var upButton:AntButton;
		private var power:PowerUpDataBase;
		private var isDes:Boolean = false;
		
		
		public function UpgradeActor(upName:String, power:PowerUpDataBase) 
		{
			super();
			
			this.power = power;
			
			title = new AntLabel("system", 10, 0xffffff);
			title.text = upName;
			add(title);
			
			view = new AntActor();
			view.addAnimationFromCache(AssetLoader.UPDATE_LINES);
			view.reset(0, 20);
			add(view);
			view.gotoAndStop(power.level + 1);
			
			var t:String = "";
			if (power.level < 6) t = power.priceList[power.level].toString();
			upButton = AntButton.makeButton(AssetLoader.EMPTY_BUTTON, t, new AntLabel("system", 14, 0x880000));
			upButton.reset(140, 16);
			add(upButton);
			
			upButton.eventClick.add(onClickUpgrade);
			//UserData.money.addEventListener(Money.CHANGE_BALANCE, onChangeBalance);
			updateButton();
			
			
			
		}
		
		private function onChangeBalance(e:Event = null):void 
		{
			
			updateButton();
			view.gotoAndStop(power.level + 1);
		}
		
		override public function update():void 
		{
			super.update();
			updateButton();
		}
		
		private function updateButton():void {
			// если проапгрейдили максимально
			if (power.isMaxUpgrade) {
				if (!isDes) upButton.destroy();
				view.gotoAndStop(7);
				isDes = true;
				return;
			}
			if (UserData.money.money < power.priceList[power.level]) {
				//upButton.text = ":(";
				upButton.text = power.priceList[power.level].toString();
			} else {
				upButton.text = power.priceList[power.level].toString();
			}
			view.gotoAndStop(power.level + 1);
		}
		
		private function onClickUpgrade(btn:AntButton):void 
		{
			if (UserData.money.money >= power.priceList[power.level]) 
			{
				UserData.money.decMoney(power.priceList[power.level]);
				
				if (power.level + 1 < power.priceList.length) {
					power.level++;
					
				} else {
					power.isMaxUpgrade = true;
				}
				onChangeBalance();
				UserData.save();
			}
		}
		
		
	}

}