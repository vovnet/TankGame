package enemies 
{
	import enemies.behaviors.SimpleDenstructible;
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class BricksEnemy extends EnemyBase 
	{
		
		// constructor
		public function BricksEnemy() 
		{
			super();
			
			behavior = new SimpleDenstructible(this);
			addAnimationFromCache(AssetLoader.ENEMY_CAR);
			
			// выбираем рандомную машинку
			playRandomFrame();
			stop();
		}
		
		
		
	}

}