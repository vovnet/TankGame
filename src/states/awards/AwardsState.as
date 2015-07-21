package states.awards 
{
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.MenuState;
	import user.StatAward;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AwardsState extends AntState 
	{
		
		public function AwardsState() 
		{
			super();
			
		}
		
		override public function create():void 
		{
			super.create();
			
			for (var i:int = 0; i < user.StatAward.awards.length; i++) {
				var aw:AntAwardData = AntStatistic.getAward(user.StatAward.awards[i]);
				var img:String = "award_block";
				if (aw.isEarned) {
					img = aw.userData.img;
				}
				var view:AwardView = new AwardView(aw.userData.title, aw.userData.desc, img);
				view.reset(30, i * (view.height + 20) + 10);
				add(view);
			}
			
			var backBtn:AntButton = AntButton.makeButton("simple_button", "Back", new AntLabel("system"));
			backBtn.reset(AntG.width / 2 - backBtn.width / 2, 460);
			backBtn.useSystemCursor = false;
			add(backBtn);
			backBtn.eventClick.add(onClickBack);
		}
		
		private function onClickBack(btn:AntButton):void 
		{
			Main.stManager.switchWindow(MenuState);
		}
		
	}

}