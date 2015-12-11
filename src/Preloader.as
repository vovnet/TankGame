package
{
	import adobe.utils.CustomActions;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntAssetLoader;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Preloader extends MovieClip 
	{
		[Embed(source = "../assets/img/preload_background.jpg")]
		private static var PreloadBackground:Class;
		[Embed(source = "../assets/img/play_button_01.png")]
		private static var PrelButton1:Class;
		[Embed(source = "../assets/img/play_button_02.png")]
		private static var PrelButton2:Class;
		
		
		public static var isUnlock:Boolean = false;
		
		private var tField:TextField = new TextField();
		private var tFormat:TextFormat = new TextFormat();
		private var playButton:SimpleButton;
		private var container:Sprite = new Sprite();
		
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO show loader
			
			// sitelock
			var urls:Array = [];
			urls.push("localhost");
			urls.push("8iz.com");
			urls.push("fgl.com");
			urls.push("flashgamelicense.com");
			var domain:String = SiteLock.getDomain(loaderInfo);
			if (SiteLock.checkDomain(domain, urls))
			{
				isUnlock = true;
			} else {
				isUnlock = false;
			}
			
			// this is unlock version
			isUnlock = true;
			
			var back:Sprite = new Sprite();
			back.addChild(new PreloadBackground());
			addChild(back);
			
			tField.selectable = false;
			tField.textColor = 0xffffff;
			tField.width = 450;
			tField.y = 470;
			
			tFormat.size = 18;
			tFormat.align = "center";
			tFormat.font = "Comic Sans MS";
			
			tField.defaultTextFormat = tFormat;
			addChild(tField);
			
			container.addChild(back);
			container.addChild(tField);
			addChild(container);
			
		}
		
		
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			// TODO update loader
			var percent:int = (e.bytesLoaded / e.bytesTotal) * 100;
			var loaded:Number = int((e.bytesLoaded / 1024) * 100) / 100;
			var total:Number = int((e.bytesTotal / 1024) * 100) / 100;
			
			tField.text = total + " Kb / " + loaded + " Kb";
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO hide loader
			var btn1:Sprite = new Sprite();
			btn1.addChild(new PrelButton1());
			var btn2:Sprite = new Sprite();
			btn2.addChild(new PrelButton2);
			playButton = new SimpleButton(btn1, btn2, btn1, btn1);
			playButton.x = stage.width / 2 - playButton.width / 2;
			playButton.y = 506;
			container.addChild(playButton);
			playButton.addEventListener(MouseEvent.CLICK, onClickPlay);
			
			
		}
		
		private function onClickPlay(e:MouseEvent):void 
		{
			removeChild(container);
			// запускаем если сайтлок прошел
			if (isUnlock) {
				startup();
			}
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
		
		
	}
	
}