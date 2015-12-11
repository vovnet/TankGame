package states.awards 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
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
	public class AwardsState extends AntState {
		
		override public function create():void {
			super.create();
			
			var back:AntActor = new AntActor();
			back.addAnimationFromCache(AssetLoader.BACK_UPGRADE_ACHIV);
			add(back);
			
			// контейнер для страничек
			var listOfPages:PageList = new PageList();
			
			var actorsPerPage:int = 5;
			var numPages:int = Math.ceil( StatAward.awards.length / actorsPerPage);
			var count:int = 0;
			
			var page:AntEntity;
			var img:String;
			var view:AwardView;
			for (var i:int = 0; i < numPages; i++) {
				page = new AntEntity();
				
				for (var j:int = 0; j < actorsPerPage; j++) {
					// если перебрали все награды, заканчиваем цикл
					if (count >= StatAward.awards.length) {
						break;
					}
					
					var aw:AntAwardData = AntStatistic.getAward(user.StatAward.awards[count]);
					img = AssetLoader.AWARD_LOCK;
					if (aw.isEarned) {
						img = aw.userData.img;
					}
					view = new AwardView(aw.userData.title, aw.userData.desc, img, aw);
					view.reset(30, j * (view.height + 10) + 10);
					page.add(view);
					
					count++;
				}
				listOfPages.push(page);
			}
			add(listOfPages);
			
			// показываем отображалку
			listOfPages.show();
			
			var backBtn:AntButton = AntButton.makeButton(AssetLoader.BACK_BUTTON);
			backBtn.reset(AntG.width / 2 - backBtn.width / 2, 550);
			backBtn.useSystemCursor = false;
			add(backBtn);
			backBtn.eventClick.add(onClickBack);
		}
		
		private function onClickBack(btn:AntButton):void {
			Main.stManager.switchWindow(MenuState);
		}
		
	}

}