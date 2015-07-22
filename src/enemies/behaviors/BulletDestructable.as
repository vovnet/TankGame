package enemies.behaviors 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.GameState;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class BulletDestructable implements IBehavior 
	{
		private var actor:AntActor;
		
		public function BulletDestructable(actor:AntActor) 
		{
			this.actor = actor;
		}
		
		/* INTERFACE enemies.behaviors.IBehavior */
		
		public function update():void 
		{
			actor.velocity.y = GameState.speed;
			
			if (GameState.t != null) {
				if (actor.bounds.intersectsRect(GameState.t.bounds)) {
					actor.kill();
					GameState.isEnd = true;
				} else if (GameState.bullet != null && actor.bounds.intersectsRect(GameState.bullet.bounds)) {
					actor.kill();
					GameState.bullet.kill();
				}
			}
		}
		
	}

}