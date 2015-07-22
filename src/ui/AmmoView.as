package ui 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
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
			
			addAnimationFromCache("ammo");
			
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