package states 
{
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntState;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class CreditsState extends AntState 
	{
		
		public function CreditsState() 
		{
			super();
			
		}
		
		override public function create():void 
		{
			var lab:AntLabel = new AntLabel("system", 12, 0xffffff);
			lab.text = "This is my credits";
			add(lab);
		}
		
	}

}