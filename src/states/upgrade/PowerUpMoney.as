package states.upgrade 
{
	import states.upgrade.PowerUpDataBase
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerUpMoney extends PowerUpDataBase 
	{
		
		public function PowerUpMoney() 
		{
			priceList.push(0);
			priceList.push(150);
			priceList.push(400);
			priceList.push(1000);
			priceList.push(2000);
			priceList.push(3300);
			
			time.push(8);
			time.push(15);
			time.push(19);
			time.push(25);
			time.push(31);
			time.push(39);
		}
		
	}

}