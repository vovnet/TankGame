package states.awards 
{
	import adobe.utils.CustomActions;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.MenuState;
	import ui.PageList;
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
			
			var a:PageList = new PageList();
			add(a);
			
			var actorsPerPage:int = 3;
			var numPages:int = Math.ceil( StatAward.awards.length / actorsPerPage);
			var count:int = 0;
			
			for (var i:int = 0; i < numPages; i++) {
				var page:AntEntity = new AntEntity();
				
				for (var j:int = 0; j < actorsPerPage; j++) {
					// если перебрали все награды, заканчиваем цикл
					if (count >= StatAward.awards.length) {
						break;
					}
					
					var aw:AntAwardData = AntStatistic.getAward(user.StatAward.awards[count]);
					var img:String = "award_block";
					if (aw.isEarned) {
						img = aw.userData.img;
					}
					var view:AwardView = new AwardView(aw.userData.title, aw.userData.desc, img);
					page.add(view);
					view.reset(30, j * (view.height + 20) + 10);
					
					count++;
				}
				a.push(page);
			}
			
			// показываем отображалку
			a.show();
			
			var backBtn:AntButton = AntButton.makeButton("simple_button", "Back", new AntLabel("system"));
			backBtn.reset(AntG.width / 2 - backBtn.width / 2, 560);
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