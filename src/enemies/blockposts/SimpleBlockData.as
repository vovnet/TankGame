package enemies.blockposts 
{
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class SimpleBlockData 
	{
		public var posX:int;
		public var posY:int;
		public var type:Class;
		
		/**
		 * Хранит данные о препятствии
		 * @param	posX позиция по х
		 * @param	posY позиция по y
		 * @param	type класс блока
		 */
		public function SimpleBlockData(posX:int, posY:int, type:Class) 
		{
			this.posX = posX;
			this.posY = posY;
			this.type = type;
		}
		
	}

}