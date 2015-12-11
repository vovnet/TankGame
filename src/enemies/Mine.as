package enemies 
{
	import enemies.behaviors.Indestructible;
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Mine extends EnemyBase 
	{
		
		public function Mine() 
		{
			super();
			
			behavior = new Indestructible(this);
			addAnimationFromCache(AssetLoader.ENEMY_MINE);
		}
		
	}

}