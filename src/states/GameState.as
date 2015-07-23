package states 
{
	import adobe.utils.CustomActions;
	import bonus.BonusBase;
	import enemies.blockposts.BlockPost;
	import enemies.BricksEnemy;
	import enemies.EnemyBase;
	import enemies.PitEnemy;
	import popups.AwardNotice;
	import popups.EndWindow;
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
	import ru.antkarlov.anthill.AntRect;
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
	import user.StatAward;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class GameState extends AntState 
	{
		public static var t:Tank;
		public static var speed:Number;
		public static var isEnd:Boolean;
		public static var bullet:Bullet;
		
		// счетчик собранных денег
		public var countMoney:int = 0;
		
		public var mainLayer:AntEntity;
		public var uiLayer:AntEntity;
		
		public static var isPause:Boolean;
		
		private var distanceLabel:AntLabel;
		
		// карта
		private var world:WorldBackground;
		
		// счетчик пройденного расстояния
		private var distance:Number = 0;
		
		private var moneyPanel:MoneyView;
		
		// расстояние до следующего блокпоста
		private var nextBlockpostDistance:int = 20;
		// позиция текущего блокпоста
		private var currentBlockpostPosition:int = 0;
		
		// окно паузы
		private var winPause:PauseWindow = new PauseWindow();
		
		// окно конца игры
		private var winEnd:EndWindow;
		private var isShowEndWindow:Boolean = false;
		
		public function GameState() 
		{
			super();
			
			
		}
		
		override public function create():void 
		{
			init();
			BlockPost.init();
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
			
			if (distanceLabel != null) {
				distance += (world.velocity.y / 20) * AntG.elapsed;
				distanceLabel.text = distance.toFixed() + " m";
				respawnEnemies();
			}
		}
		
		public function fire():void 
		{
			if (bullet != null) return;
			
			AntG.sounds.play("shootSound");
			bullet = defGroup.recycle(Bullet) as Bullet;
			
			if (bullet.alive == false)
			{
				bullet.reset(t.x, t.y - 8);
				bullet.revive();
			} else {
				bullet.reset(t.x, t.y - 8);
			}
			
			mainLayer.add(bullet);
			
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
			speed = 200;
			isPause = false;
			isEnd = false;
			
			mainLayer = new AntEntity();
			add(mainLayer);
			
			uiLayer = new AntEntity();
			add(uiLayer);
			
			world = new WorldBackground();
			mainLayer.add(world);
			
			winEnd = new EndWindow(this);
			uiLayer.add(winPause);
			uiLayer.add(winEnd);
			
			t = new Tank(this);
			t.y = 540;
			mainLayer.add(t);
			t.play();
			
			moneyPanel = new MoneyView();
			moneyPanel.reset(5, 20);
			uiLayer.add(moneyPanel);
			
			var ammoPanel:AmmoView = new AmmoView();
			ammoPanel.reset(5, 550);
			uiLayer.add(ammoPanel);
			
			distanceLabel = new AntLabel("system", 12, 0xffffff);
			distanceLabel.text = distance.toString();
			distanceLabel.reset(160, 20);
			uiLayer.add(distanceLabel);
			
			var pauseBtn:AntButton = AntButton.makeButton("simple_button", "Pause", new AntLabel("system", 14, 0x000000));
			pauseBtn.x = 340;
			pauseBtn.y = 30;
			uiLayer.add(pauseBtn);
			pauseBtn.eventClick.add(onClickPause);
			
			AntStatistic.eventAwardEarned.add(onAwardEarned);
			
		}
		
		// обработчик события получения награды
		private function onAwardEarned(award:AntAwardData):void 
		{
			var g:AwardNotice = new AwardNotice(award);
			uiLayer.add(g);
		}
		
		private function onClickPause(btn:AntButton):void 
		{
			if (isPause) return;
			isPause = true;
			winPause.show();	
		}
		
		public function endGame():void {
			// если окно было показано, больше не вызываем его
			if (isShowEndWindow) {
				return;
			}
			isPause = true;
			isShowEndWindow = true;
			world.velocity.y = 0;
			speed = 0;
			UserData.save();
			winEnd.show();
		}
		
		public function reset():void {
			// окно не пересоздается, а просто задвигает шторки
			Main.stManager.switchWindow(GameState);
			
			speed = 200;
			isPause = false;
			isEnd = false;
			isShowEndWindow = false;
			distance = 0;
			countMoney = 0;
			BlockPost.init();
			currentBlockpostPosition = 0;
			nextBlockpostDistance = 20;
			
			// отключаем паверапы у танка, если имеются
			if (t.power != null) t.power.kill();
			
			// удаляем препятствия, бонусы и т.д.
			while (mainLayer.getAlive(EnemyBase)){
				mainLayer.getAlive(EnemyBase).kill();
			}
			
			while (mainLayer.getAlive(BonusBase)){
				mainLayer.getAlive(BonusBase).kill();
			}
			
			while (mainLayer.getAlive(PowerUpBase)){
				mainLayer.getAlive(PowerUpBase).kill();
			}
			
		}
		
		
	}

}