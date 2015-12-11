package ui 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import states.GameState;
	import user.UserData;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AmmoView extends AntActor 
	{
		private var label:AntLabel;
		
		public function AmmoView() 
		{
			super();
			
			var actor:AntActor = new AntActor();
			actor.addAnimationFromCache(AssetLoader.ICON_AMMO);
			actor.reset(30, -15, 45);
			add(actor);
			
			label = new AntLabel("system", 24);
			label.text = user.UserData.bullets.toString();
			label.x = 50;
			add(label);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			label.text = user.UserData.bullets.toString();
		}
		
	}

}