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
			priceList.push(50);
			priceList.push(60);
			priceList.push(105);
			priceList.push(180);
			priceList.push(300);
			
			time.push(8);
			time.push(16);
			time.push(20);
			time.push(37);
			time.push(45);
			time.push(55);
		}
		
	}

}