package enemies.behaviors 
{
	import enemies.behaviors.IBehavior;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntRect;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	import states.GameState;
	/**
	 * Поведение, при котором объект разрушается при столкновении с танком
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class SimpleDenstructible implements IBehavior 
	{
		private var actor:AntActor;
		
		public function SimpleDenstructible(actor:AntActor) 
		{
			this.actor = actor;
		}
		
		/* INTERFACE enemies.IBehavior */
		
		public function update():void 
		{
			actor.velocity.y = GameState.speed;
			
			if (GameState.t != null) {
				if (actor.bounds.intersectsRect(GameState.t.bounds)) {
					AntStatistic.track("kills", 1);
					actor.kill();
				} else if (GameState.bullet != null && actor.bounds.intersectsRect(GameState.bullet.bounds)) {
					actor.kill();
					GameState.bullet.kill();
				}
			}
		}
		
	}

}