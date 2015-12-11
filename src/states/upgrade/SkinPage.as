package states.upgrade 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import user.StatAward;
	import user.UserData;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SkinPage extends AntEntity 
	{
		private var price:int = 0;
		private var id:int = 1;
		private var btn:AntButton;
		private var actor:AntActor = new AntActor();
		private var moneyLabel:AntLabel;
		
		public function SkinPage(id:int, price:int) 
		{
			super();
			this.price = price;
			this.id = id;
			
			var img:AntActor = new AntActor();
			img.addAnimationFromCache(AssetLoader.ICON_MONEY);
			img.reset(0, 0);
			add(img);
			
			moneyLabel = new AntLabel("system", 24, 0xffffff);
			moneyLabel.text = UserData.money.money.toString();
			moneyLabel.reset(60, 0);
			add(moneyLabel);
			
			setSkin();
			
			actor.reset((AntG.width / 2 - actor.width / 2) - 50, 80);
			add(actor);
			
			btn = AntButton.makeButton(AssetLoader.EMPTY_BUTTON, price.toString(), new AntLabel("system", 14, 0x880000));
			btn.reset((AntG.width / 2 - btn.width / 2) - 50, 330);
			btn.useSystemCursor = false;
			
			add(btn);
			btn.eventClick.add(onClickBack);
		}
		
		// press button buy tank
		private function onClickBack(btn:AntButton):void 
		{
			if (!isBuyTankById()) {
				buyTank();
			} else {
				UserData.tankId = id;
			}
		}
		
		
		
		override public function update():void 
		{
			super.update();
			moneyLabel.text = UserData.money.money.toString();
			if (UserData.tankId == id) {
				btn.text = "Selected";
			} else if (isBuyTankById()) {
				btn.text = "Select";
			}
		}
		
		private function setSkin():void 
		{
			switch (id) {
				case 1:
					actor.addAnimationFromCache(AssetLoader.SKIN_1);
					break;
				case 2:
					actor.addAnimationFromCache(AssetLoader.SKIN_2);
					break;
				case 3:
					actor.addAnimationFromCache(AssetLoader.SKIN_3);
					break;
				case 4:
					actor.addAnimationFromCache(AssetLoader.SKIN_4);
					break;
				case 5:
					actor.addAnimationFromCache(AssetLoader.SKIN_5);
					break;
				default:
					throw new Error("Нет танка с таким id");
					break;
			}
		}
		
		private function buyTank():void {
			// если не хватает денег
			if (price > UserData.money.money) return;
			
			// покупаем
			AntStatistic.track(StatAward.COLLECTOR, 1);
			UserData.money.decMoney(price);
			UserData.save();
			
			switch (id) {
				case 1:
					UserData.isBuyTank1 = true;
					break;
				case 2:
					UserData.isBuyTank2 = true;
					break;
				case 3:
					UserData.isBuyTank3 = true;
					break;
				case 4:
					UserData.isBuyTank4 = true;
					break;
				case 5:
					UserData.isBuyTank5 = true;
					break;
				default:
					throw new Error("Нет танка с таким id");
					break;
			}
		}
		
		/**
		 * Куплен ли текущий танк
		 * @return
		 */
		private function isBuyTankById():Boolean {
			switch (id) {
				case 1:
					return UserData.isBuyTank1;
					break;
				case 2:
					return UserData.isBuyTank2;
					break;
				case 3:
					return UserData.isBuyTank3;
					break;
				case 4:
					return UserData.isBuyTank4;
					break;
				case 5:
					return UserData.isBuyTank5;
					break;
				default:
					throw new Error("Нет танка с таким id");
					break;
			}
			return false;
		}
		
	}

}