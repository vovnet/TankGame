package enemies.behaviors 
{
	import enemies.behaviors.IBehavior;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntRect;
	import states.GameState;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class Indestructible implements IBehavior 
	{
		private var actor:AntActor;
		
		public function Indestructible(actor:AntActor) 
		{
			this.actor = actor;
		}
		
		/* INTERFACE enemies.IBehavior */
		
		public function update():void 
		{
			actor.velocity.y = GameState.speed;
			
			if (GameState.t != null) {
				if (actor.bounds.intersectsRect(GameState.t.bounds)) {
					actor.kill();
					GameState.isEnd = true;
				}
			}
		}
		
	}

}