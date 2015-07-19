package enemies 
{
	import enemies.behaviors.Indestructible;
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PitEnemy extends EnemyBase
	{
		
		// constructor
		public function PitEnemy() 
		{
			super();
			
			behavior = new Indestructible(this);
			addAnimationFromCache("pit_mc");
		}
		
	
		
	}

}