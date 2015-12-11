package powerups 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import states.GameState;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PowerPanel extends AntActor 
	{
		private var back:AntActor = new AntActor();
		private var frontMoney:AntActor = new AntActor();
		private var frontReaction:AntActor = new AntActor();
		private var frontAmmo:AntActor = new AntActor();
		private var label:AntLabel;
		
		public function PowerPanel() 
		{
			super();
			
			back.addAnimationFromCache(AssetLoader.ICON_PLAX);
			back.reset( -6, -6);
			add(back);
			back.visible = false;
			
			frontMoney.addAnimationFromCache(AssetLoader.ICON_MONEY_BONUS);
			frontReaction.addAnimationFromCache(AssetLoader.ICON_REACTION_BONUS);
			frontAmmo.addAnimationFromCache(AssetLoader.ICON_AMMO_BONUS);
			add(frontAmmo);
			add(frontMoney);
			add(frontReaction);
			frontReaction.visible = false;
			frontAmmo.visible = false;
			frontMoney.visible = false;
			
			label = new AntLabel("system", 16);
			label.align = "center";
			label.setStroke(0x990000);
			label.reset(20, 15);
			add(label);
			label.visible = false;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (GameState.t.power != null) {
				back.visible = true;
				updateSkin();
				label.visible = true;
				var timer:int = GameState.t.power.timeUp - GameState.t.power.countTime;
				label.text = timer.toString();
			} else {
				frontReaction.visible = false;
				frontAmmo.visible = false;
				frontMoney.visible = false;
				label.visible = false;
				back.visible = false;
			}
		}
		
		private function updateSkin():void {
			switch (GameState.t.power.id) {
				case 1:
					frontMoney.visible = true;
					frontReaction.visible = false;
					frontAmmo.visible = false;
					break;
				case 2:
					frontReaction.visible = true;
					frontAmmo.visible = false;
					frontMoney.visible = false;
					break;
				case 3:
					frontAmmo.visible = true;
					frontReaction.visible = false;
					frontMoney.visible = false;
					break;
				default:
					frontReaction.visible = false;
					frontAmmo.visible = false;
					frontMoney.visible = false;
					break;
			}
		}
		
	}

}