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
			priceList.push(200);
			priceList.push(500);
			priceList.push(1300);
			priceList.push(2200);
			priceList.push(4000);
			
			time.push(8);
			time.push(15);
			time.push(19);
			time.push(25);
			time.push(31);
			time.push(39);
		}
		
	}

}