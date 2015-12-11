package states {
	import bonus.BonusBase;
	import enemies.blockposts.BlockPost;
	import enemies.EnemyBase;
	import enemies.Explotion;
	import instructions.GameInstructor;
	import popups.AwardNotice;
	import popups.EndWindow;
	import popups.PauseWindow;
	import powerups.actors.PowerUpBase;
	import powerups.PowerPanel;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import tanks.Bullet;
	import tanks.Tank;
	import ui.AmmoView;
	import ui.MoneyView;
	import ui.SpeedUp;
	import user.StatAward;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class GameState extends AntState {
		public static var t:Tank;
		public static var speed:Number;
		public static var isEnd:Boolean;
		public static var bullet:Bullet;
		public static var instance:GameState;
		
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
		
		private var powerPanel:PowerPanel = new PowerPanel();
		
		public var countBlockPosts:int = 0;
		
		override public function create():void {
			init();
			BlockPost.init();
			instance = this;
		}
		
		override public function update():void {
			super.update();
			
			if (AntG.keys.isPressed("R")) {
				reset();
			}
			
			if (AntG.keys.isPressed("P")) {
				isPause = !isPause;
				if (isPause) {
					winPause.show();
				} else {
					winPause.hide();
				}
			}
			
			if (isPause)
				return;
			
			if (isEnd) {
				endGame();
				return;
			}
			
			
			
			// каждые 30 блокпостов увеличиваем уровень и скорость
			if (countBlockPosts == 30) {
				speed += 40;
				countBlockPosts = 0;
				showSpeedUp();
				if (UserData.level < 2) {
					UserData.level++;
				}
			}
			
			// обновляем достижения по дистанции
			AntStatistic.track(StatAward.DRIVER, distance);
			if (distanceLabel != null) {
				distance += (world.velocity.y / 20) * AntG.elapsed;
				distanceLabel.text = distance.toFixed() + " m";
				respawnEnemies();
			}
		}
		
		public function fire():void {
			if (bullet != null)
				return;
			
			AntG.sounds.play("shootSound");
			bullet = defGroup.recycle(Bullet) as Bullet;
			
			if (bullet.alive == false) {
				bullet.reset(t.x, t.y - 8);
				bullet.revive();
			} else {
				bullet.reset(t.x, t.y - 8);
			}
			mainLayer.add(bullet);
		}
		
		private function respawnEnemies():void {
			if (int(distance) == (currentBlockpostPosition + nextBlockpostDistance)) {
				currentBlockpostPosition = distance;
				nextBlockpostDistance = BlockPost.respawn(this);
				countBlockPosts++;
				world.z = 0;
				mainLayer.sort("z");
			}
		}
		
		private function init():void {
			UserData.level = 0;
			countBlockPosts = 0;
			speed = 200;
			isPause = false;
			isEnd = false;
			
			mainLayer = new AntEntity();
			add(mainLayer);
			
			uiLayer = new AntEntity();
			add(uiLayer);
			
			world = new WorldBackground();
			mainLayer.add(world);
			
			var instructor:GameInstructor = new GameInstructor();
			mainLayer.add(instructor);
			
			winEnd = new EndWindow(this);
			uiLayer.add(winPause);
			uiLayer.add(winEnd);
			
			t = new Tank(this);
			t.y = 530;
			mainLayer.add(t);
			t.z = 99;
			t.play();
			
			moneyPanel = new MoneyView();
			moneyPanel.reset(5, 20);
			uiLayer.add(moneyPanel);
			
			var ammoPanel:AmmoView = new AmmoView();
			ammoPanel.reset(5, 550);
			uiLayer.add(ammoPanel);
			
			distanceLabel = new AntLabel("system", 12, 0xffffff);
			distanceLabel.text = distance.toString();
			distanceLabel.reset(200, 20);
			uiLayer.add(distanceLabel);
			
			var pauseBtn:AntButton = AntButton.makeButton(AssetLoader.PAUSE_CIRCLE_BUTTON);
			pauseBtn.reset(386, 20);
			uiLayer.add(pauseBtn);
			pauseBtn.eventClick.add(onClickPause);
			
			AntStatistic.eventAwardEarned.add(onAwardEarned);
			
			powerPanel.reset(386, 530);
			add(powerPanel);
		}
		
		public function explotion(posX:Number, posY:Number):void {
			var actor:AntActor = new Explotion();
			actor.reset(posX - 80, posY - 100);
			mainLayer.add(actor);
			actor.z = 266;
			AntG.sounds.play("explotion");
		}
		
		// обработчик события получения награды
		private function onAwardEarned(award:AntAwardData):void {
			var g:AwardNotice = new AwardNotice(award);
			uiLayer.add(g);
		}
		
		private function onClickPause(btn:AntButton):void {
			if (isPause)
				return;
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
			winEnd.show(Math.round(distance));
		}
		
		public function reset():void {
			// окно не пересоздается, а просто задвигает шторки
			Main.stManager.switchWindow(GameState);
			
			winPause.hide();
			UserData.level = 0;
			countBlockPosts = 0;
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
			if (t.power != null)
				t.power.kill();
			
			// удаляем препятствия, бонусы и т.д.
			while (mainLayer.getAlive(EnemyBase)) {
				mainLayer.getAlive(EnemyBase).kill();
			}
			
			while (mainLayer.getAlive(BonusBase)) {
				mainLayer.getAlive(BonusBase).kill();
			}
			
			while (mainLayer.getAlive(PowerUpBase)) {
				mainLayer.getAlive(PowerUpBase).kill();
			}
		}
		
		public function showSpeedUp():void {
			var up:AntActor = defGroup.recycle(SpeedUp) as AntActor;
			up.reset(100, 200);
			uiLayer.add(up);
		}
	
	}

}