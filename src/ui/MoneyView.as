package ui 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import user.UserData;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class MoneyView extends AntActor 
	{
		private var label:AntLabel;
		
		public function MoneyView() 
		{
			label = new AntLabel("system", 20);
			label.text = user.UserData.money.toString();
			label.reset(50, 10);
			add(label);
			
			var img:AntActor = new AntActor();
			img.addAnimationFromCache("iconMoney");
			add(img);
		}
		
		override public function update():void 
		{
			super.update();
			
			label.text = user.UserData.money.money.toString();
		}
		
	}

}