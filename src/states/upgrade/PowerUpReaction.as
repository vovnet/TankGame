package states.upgrade 
{
	
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class PowerUpReaction extends PowerUpDataBase 
	{
		
		public function PowerUpReaction() 
		{
			priceList.push(0);
			priceList.push(10);
			priceList.push(20);
			priceList.push(45);
			priceList.push(80);
			priceList.push(100);
			
			time.push(8);
			time.push(16);
			time.push(20);
			time.push(37);
			time.push(45);
			time.push(55);
		}
		
	}

}