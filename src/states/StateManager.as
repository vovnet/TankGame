package states {
	import flash.display.Sprite;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.Anthill;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class StateManager extends Sprite {
		[Embed(source = "../../assets/img/up_shtora_1.png")]
		protected static var upShtora:Class;
		
		[Embed(source = "../../assets/img/down_shtora_1.png")]
		protected static var downShtora:Class;
		
		// слой со всей игрой
		private var gameLayer:Sprite = new Sprite();
		
		private var downFader:Sprite = new Sprite();
		private var upFader:Sprite = new Sprite();
		
		private var window:Class;
		private var oldWindow:Class;
		
		private var isUpOver:Boolean = false;
		private var isDownOver:Boolean = false;
		
		public function StateManager():void {
			addChild(gameLayer);
			var ant:Anthill = new Anthill(MenuState, 60);
			gameLayer.addChild(ant);
			
			downFader.addChild(new downShtora);
			upFader.addChild(new upShtora);
			
			upFader.y = -400;
			downFader.y = 600;
			
			addChild(downFader);
			addChild(upFader);
		}
		
		public function switchWindow(window:Class):void {
			oldWindow = this.window;
			this.window = window;
			
			var tweenUpFader:AntTween = new AntTween(upFader, 0.3);
			tweenUpFader.animate("y", 0);
			
			var tweenDownFader:AntTween = new AntTween(downFader, 0.3);
			tweenDownFader.animate("y", 300);
			
			tweenDownFader.start();
			tweenUpFader.start();
			
			AntG.sounds.play("shtoreCloseSound", 0.2);
			var al:AntTween = new AntTween(gameLayer, 0.2);
			al.fadeTo(0);
			al.start();
			
			tweenDownFader.eventComplete.add(onCloseFader);
		}
		
		private function onCloseFader():void {
			if (oldWindow != window) {
				AntG.switchState(new window);
			}
			
			var tweenUpFader:AntTween = new AntTween(upFader, 0.3);
			tweenUpFader.animate("y", -400);
			tweenUpFader.delay = 0.5;
			
			var tweenDownFader:AntTween = new AntTween(downFader, 0.3);
			tweenDownFader.animate("y", 600);
			tweenDownFader.delay = 0.5;
			
			tweenUpFader.start();
			tweenDownFader.start();
			
			tweenUpFader.eventStart.add(onStartOpen);
		}
		
		private function onStartOpen():void {
			var al:AntTween = new AntTween(gameLayer, 0.2);
			al.fadeTo(1);
			al.start();
			//al.eventComplete.add(onHideFader);
		}
		
		private function onHideFader():void {
			upFader.visible = false;
			downFader.visible = false;
		}
	
	}

}