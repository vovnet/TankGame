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
			label = new AntLabel("system", 12);
			label.text = user.UserData.money.toString() + " $";
			add(label);
		}
		
		override public function update():void 
		{
			super.update();
			
			label.text = user.UserData.money.money.toString() + " $";
		}
		
	}

}