package enemies.behaviors 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.GameState;
	import user.StatAward;
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
					GameState.instance.explotion(actor.x, actor.y);
					AntStatistic.track(StatAward.DEAD, 1);
				} else if (GameState.bullet != null && actor.bounds.intersectsRect(GameState.bullet.bounds)) {
					actor.kill();
					GameState.bullet.kill();
					GameState.instance.explotion(actor.x, actor.y);
				}
			}
		}
		
	}

}