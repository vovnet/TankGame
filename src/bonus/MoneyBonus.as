package bonus 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.GameState;
	import user.StatAward;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MoneyBonus extends BonusBase 
	{
		
		public function MoneyBonus() 
		{
			super();
			addAnimationFromCache(AssetLoader.MONEY_BONUS);
			animationSpeed = 0.3;
			playRandomFrame();
			play();
			
			sound = "addBonus";
		}
		
		override public function update():void 
		{
			super.update();
			if (GameState.isPause)
			{
				stop();
				return;
			}
			play();
		}
		
		override public function behavior():void 
		{
			super.behavior();
			
			GameState.t.increaceMoney(10);
		}
		
		
	}

}