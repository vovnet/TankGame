package states 
{
	import enemies.blockposts.BlockPost;
	import enemies.BricksEnemy;
	import enemies.PitEnemy;
	import popups.AwardNotice;
	import popups.PauseWindow;
	import powerups.actors.PowerReaction;
	import powerups.actors.PowerUpBase;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntCamera;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.AntPoint;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.debug.AntMemory;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	import ru.antkarlov.anthill.utils.AntColor;
	import tanks.Bullet;
	import tanks.Tank;
	import ui.AmmoView;
	import ui.MoneyView;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class GameState extends AntState 
	{
		public static var t:Tank;
		public static var speed:Number;
		public static var isEnd:Boolean = false;
		public static var bullet:Bullet;
		
		public static var isPause:Boolean;
		
		private var lab:AntLabel;
		
		// карта
		private var world:WorldBackground;
		
		// счетчик пройденного расстояния
		private var distance:Number = 1;
		
		private var countMoney:int = 0;
		private var moneyPanel:MoneyView;
		
		private var mainLayer:AntEntity;
		private var uiLayer:AntEntity;
		
		// расстояние до следующего блокпоста
		private var nextBlockpostDistance:int = 10;
		// позиция текущего блокпоста
		private var currentBlockpostPosition:int = 0;
		
		public function GameState() 
		{
			super();
		}
		
		override public function create():void 
		{
			world = new WorldBackground();
			add(world);
			
			init();
			
			BlockPost.init();
			
			speed = 200;
			isPause = false;
			isEnd = false;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (isPause) return;
			
			if (isEnd) {
				endGame();
				return;
			}
			
			// test speed up
			if (AntG.keys.isDown("UP")) {
				speed += 8;
			} else if (AntG.keys.isDown("DOWN")) {
				speed -= 8;
			}
			world.velocity.y = speed;
			
			if (lab != null) {
				distance += (world.velocity.y / 20) * AntG.elapsed;
				lab.text = distance.toFixed() + " m";
				respawnEnemies();
				AntStatistic.track(StatAward.DRIVER, int(distance));
			}
		}
		
		public function fire():void 
		{
			if (bullet != null) return;
			
			bullet = defGroup.recycle(Bullet) as Bullet;
			
			if (bullet.alive == false)
			{
				bullet.reset(t.x, t.y - 8);
				bullet.revive();
			} else {
				bullet.reset(t.x, t.y - 8);
			}
		}
		
		private function respawnEnemies():void 
		{
			if (int(distance) == (currentBlockpostPosition + nextBlockpostDistance)) {
				currentBlockpostPosition = distance;
				nextBlockpostDistance = BlockPost.respawn(this);
			}
			
		}
		
		
		private function init():void 
		{
			t = new tanks.Tank(this);
			t.y = 540;
			add(t);
			t.play();
			
			uiLayer = new AntEntity();
			add(uiLayer);
			
			moneyPanel = new MoneyView();
			moneyPanel.reset(140, 30);
			uiLayer.add(moneyPanel);
			
			var ammoPanel:AmmoView = new AmmoView();
			ammoPanel.x = 20;
			ammoPanel.y = 550;
			uiLayer.add(ammoPanel);
			
			lab = new AntLabel("system", 12, 0xffffff);
			lab.text = distance.toString();
			lab.x = 20;
			lab.y = 30;
			add(lab);
			
			isPause = false;
			
			var pauseBtn:AntButton = AntButton.makeButton("simple_button", "Pause", new AntLabel("system", 14, 0x000000));
			pauseBtn.x = 340;
			pauseBtn.y = 30;
			add(pauseBtn);
			pauseBtn.eventClick.add(onClickPause);
			
			AntStatistic.eventAwardEarned.add(onAwardEarned);
			
		}
		
		// обработчик события получения награды
		private function onAwardEarned(award:AntAwardData):void 
		{
			var g:AwardNotice = new AwardNotice(award);
			add(g);
		}
		
		private function onClickPause(btn:AntButton):void 
		{
			isPause = !isPause;
			
			var p:PauseWindow = new PauseWindow();
			p.x = stage.width / 2 - p.width / 2;
			p.y = -100;
			add(p);
			
			var tween:AntTween = new AntTween(p, 2, AntTransition.EASE_OUT_ELASTIC);
			tween.moveTo(stage.width / 2 - p.width / 2, stage.height / 2 - p.height / 2);
			tween.start();	
			
		}
		
		public function endGame():void {
			world.velocity.y = 0;
			speed = 0;
			UserData.save();
			AntG.switchState(new MenuState);
		}
		
		
	}

}