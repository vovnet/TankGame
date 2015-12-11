package ui 
{
	import ru.antkarlov.anthill.AntActor;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class SpeedUp extends AntActor 
	{
		
		public function SpeedUp() 
		{
			super();
			
			this.addAnimationFromCache(AssetLoader.SPEED_UP);
			this.animationSpeed = 0.4;
			this.repeat = false;
			this.play();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (this.currentFrame == this.totalFrames) {
				this.kill();
			}
		}
	}

}