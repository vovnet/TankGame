package states.awards 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	
	/**
	 * Отображает награду (название, описание, иконку), если награда
	 * не получена, то показывает замочек.
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AwardView extends AntActor 
	{
		
		public function AwardView(aTitle:String, aDesc:String, aImg:String) 
		{
			super();
			
			addAnimationFromCache(aImg);
			
			
			var title:AntLabel = new AntLabel("system", 12, 0x991111);
			title.text = aTitle;
			title.wordWrap = true;
			title.setStroke(0xffffff);
			title.setSize(200, 20);
			title.align = AntLabel.LEFT;
			title.x = 56;
			title.y = -6;
			add(title);
			
			var desc:AntLabel = new AntLabel("system", 10, 0xcccccc);
			desc.text = aDesc;
			desc.wordWrap = true;
			desc.setSize(200, 40);
			desc.align = AntLabel.LEFT;
			desc.x = 56;
			desc.y = 16;
			add(desc);
		}
		
	}

}