package bonus 
{
	import user.UserData;
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
			
			user.UserData.bullets += 2;
		}
		
	}

}