package {
	import _8iz_splash_fla.mainmovie_1;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class SponsorSplash extends MovieClip {
		
		public static const COMPLETE_SPLASH:String = "complete splash";
		
		private var clip:MovieClip;
		private var timer:Timer;
		
		public function SponsorSplash() {
			super();
			
			timer = new Timer(9000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			timer.start();
			
			clip = new mainmovie_1();
			clip.x = -180;
			addChild(clip);
		
		}
		
		private function onComplete(e:TimerEvent):void {
			//removeChild(clip);
			dispatchEvent(new Event(COMPLETE_SPLASH));
		}
	
	}

}