package states.awards 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.extensions.stats.AntStatistic;
	
	/**
	 * Отображает награду (название, описание, иконку), если награда
	 * не получена, то показывает замочек.
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AwardView extends AntActor {
		
		public function AwardView(aTitle:String, aDesc:String, aImg:String, aAward:AntAwardData) {
			super();
			addAnimationFromCache(aImg);
			
			var titleColor:int = 0x444444;
			var descColor:int = 0xffffff;
			if (aAward.isEarned) {
				titleColor = 0x991111;
				descColor = 0xd0ab01;
			}
			
			var all:int = aAward.statCondition;
			var current:int = AntStatistic.getStatValue(aAward.statKey);
			current = (current > all) ? all : current;
			
			var title:AntLabel = new AntLabel("system", 12, titleColor);
			title.beginChange();
			title.text = aTitle;
			title.wordWrap = true;
			title.setStroke(0xffffff);
			title.setSize(200, 20);
			title.align = AntLabel.LEFT;
			title.reset(76, 6);
			title.endChange();
			add(title);
			
			var desc:AntLabel = new AntLabel("system", 10, descColor);
			desc.beginChange();
			desc.text = aDesc + " " + current + "/" + all;
			desc.wordWrap = true;
			desc.setSize(200, 40);
			desc.align = AntLabel.LEFT;
			desc.reset(76, 28);
			desc.endChange();
			add(desc);
		}
		
	}

}