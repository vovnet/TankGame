package popups 
{
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.extensions.stats.AntAwardData;
	import ru.antkarlov.anthill.plugins.AntTransition;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AwardNotice extends AntActor 
	{
		
		public function AwardNotice(award:AntAwardData) 
		{
			super();
			
			addAnimationFromCache("award_notice_mc");
			
			var title:AntLabel = new AntLabel("system", 12, 0x991111);
			title.text = "New achievement!";
			title.wordWrap = true;
			title.setStroke(0xffffff);
			title.setSize(250, 20);
			title.align = AntLabel.CENTER;
			add(title);
			
			var description:AntLabel = new AntLabel("system", 10, 0xcccccc);
			description.text = award.userData.title;
			description.wordWrap = true;
			description.setSize(190, 60);
			description.align = AntLabel.LEFT;
			description.x = 60;
			description.y = 25;
			add(description);
			
			var img:AntActor = new AntActor();
			img.addAnimationFromCache(award.userData.img);
			img.x = -40;
			img.y = -5;
			add(img);
			
			this.alpha = 0.7;
			
			var tween:AntTween = new AntTween(this, 0.5, AntTransition.EASE_IN_OUT_BOUNCE);
			reset(450 / 2 - this.width / 2, 650);
			tween.moveTo(this.x, 540);
			tween.start();
			
			var hideTween:AntTween = new AntTween(this, 0.2);
			hideTween.moveTo(this.x, 650);
			hideTween.delay = 2;
			hideTween.start();
			
		}
		
	}

}