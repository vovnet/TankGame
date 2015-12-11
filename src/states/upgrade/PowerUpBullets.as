package states.upgrade 
{
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerUpBullets extends PowerUpDataBase 
	{
		
		public function PowerUpBullets() 
		{
			priceList.push(0);
			priceList.push(100);
			priceList.push(350);
			priceList.push(900);
			priceList.push(1800);
			priceList.push(3000);
			
			time.push(8);
			time.push(15);
			time.push(19);
			time.push(25);
			time.push(31);
			time.push(39);
		}
		
	}

}