package ui 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
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
			label.text = UserData.money.toString() + " $";
			add(label);
		}
		
		override public function update():void 
		{
			super.update();
			
			label.text = UserData.money.toString() + " $";
		}
		
	}

}