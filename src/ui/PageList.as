package ui 
{
	import adobe.utils.CustomActions;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	
	/**
	 * Отображает много окон на одном экране, для навигации использует пронумерованные
	 * кнопки внизу экрана.
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PageList extends AntEntity 
	{
		private var pages:Vector.<AntEntity> = new Vector.<AntEntity>();
		private var buttons:Vector.<AntButton> = new Vector.<AntButton>();
		private var currentIndex:int = 0;
		private var currentPage:AntEntity;
		
		public function PageList() 
		{
			super();
			
		}
		
		/**
		 * Добавляет новый экран для отображения
		 * @param	page
		 */
		public function push(page:AntEntity):void {
			pages.push(page);
			
		}
		
		/**
		 * После добавления экранов необходимо вызвать этот метод для отрисовки
		 */
		public function show():void {
			if (pages.length < 1) return;
			
			showCurrentPage();
			
			for (var i:int = 0; i < pages.length; i++) {
				var empty:AntActor = new AntActor();
				empty.addAnimationFromCache("empty_small_button");
				empty.reset((i * 35) + 10, 500);
				add(empty);
				
				var label:AntLabel = new AntLabel("system");
				label.text = String(i + 1);
				label.reset((i * 35) + 20, 506);
				add(label);
				
				var str:String = String(i + 1);
				var btn:AntButton = AntButton.makeButton("small_Button", str, new AntLabel("system"));
				btn.reset((i * 35) + 10, 500);
				add(btn);
				btn.autoReviveChildren = true;
				buttons.push(btn);
				btn.eventClick.add(onClick);
				
				
				if (i == 0) btn.kill();
			}
		}
		
		private function onClick(btn:AntButton):void 
		{
			currentIndex = int(btn.text) - 1;
			btn.kill();
			for (var i:int = 0; i < buttons.length; i++) {
				if (buttons[i] == btn) continue;
				buttons[i].revive();
			}
			
			showCurrentPage();
		}
		
		private function showCurrentPage():void {
			if (currentPage != null) {
				remove(currentPage);
			}
			currentPage = pages[currentIndex];
			add(currentPage);
			currentPage.reset(50, 60);
			
		}
		
	}

}