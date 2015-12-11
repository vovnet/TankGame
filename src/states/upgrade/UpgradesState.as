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
	import ui.PageList;
	import user.Money;
	import user.UserData;
	
	/**
	 * Upgrades window
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
			var back:AntActor = new AntActor();
			back.addAnimationFromCache(AssetLoader.BACK_UPGRADE_ACHIV);
			add(back);
			
			var pages:PageList = new PageList();
			
			pages.push(new UpgradePage());
			
			pages.push(new SkinPage(1, 0));
			pages.push(new SkinPage(2, 10000));
			pages.push(new SkinPage(3, 25000));
			pages.push(new SkinPage(4, 50000));
			pages.push(new SkinPage(5, 100000));
			
			
			add(pages);
			pages.show();
			
			var upgradesBtn:AntButton = AntButton.makeButton(AssetLoader.BACK_BUTTON);
			upgradesBtn.reset(AntG.width / 2 - upgradesBtn.width / 2, 550);
			upgradesBtn.useSystemCursor = false;
			add(upgradesBtn);
			upgradesBtn.eventClick.add(onClickBack);
			
		}
		
		
		private function onClickBack(btn:AntButton):void 
		{
			Main.stManager.switchWindow(MenuState);
		}
		
	}

}