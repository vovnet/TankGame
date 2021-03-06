package enemies 
{
	import enemies.behaviors.BulletDestructable;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AntiTank extends EnemyBase 
	{
		
		public function AntiTank() 
		{
			super();
			
			behavior = new BulletDestructable(this);
			addAnimationFromCache(AssetLoader.ENEMY_ANTI);
		}
		
	}

}