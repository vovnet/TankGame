package enemies.blockposts 
{
	/**
	 * Хранит данные о блокпосте
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class BlockPostData 
	{
		/**
		 * Длинна блок поста (берется для расчета расстояния, через которое
		 * будет выставлен следующий блокпост)
		 */
		public var length:int;
		
		public var blocks:Vector.<SimpleBlockData>;
		
		public function BlockPostData(length:int) 
		{
			this.length = length;
			blocks = new Vector.<SimpleBlockData>();
		}
		
		public function addBlock(x:int, y:int, type:Class):void {
			blocks.push(new SimpleBlockData(x, y, type));
		}
		
	}

}