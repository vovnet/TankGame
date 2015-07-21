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
			priceList.push(15);
			priceList.push(25);
			priceList.push(46);
			priceList.push(85);
			priceList.push(200);
			
			time.push(8);
			time.push(16);
			time.push(20);
			time.push(37);
			time.push(45);
			time.push(60);
			
			
		}
		
	}

}