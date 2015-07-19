package bonus 
{
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class AmmoBonus extends BonusBase 
	{
		
		public function AmmoBonus() 
		{
			super();
			
			addAnimationFromCache("ammo_bonus");
		}
		
		override public function behavior():void 
		{
			super.behavior();
			
			UserData.bullets += 2;
		}
		
	}

}