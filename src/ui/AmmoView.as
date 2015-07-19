package ui 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	
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
			
			addAnimationFromCache("bullet_ui");
			
			label = new AntLabel("system", 12);
			label.text = UserData.bullets.toString();
			label.x = 24;
			add(label);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			label.text = UserData.bullets.toString();
		}
		
	}

}