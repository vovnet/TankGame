package tanks 
{
	import ru.antkarlov.anthill.AntG;
	/**
	 * ...
	 * @author Vladimir Saykovsky
	 */
	public class TankControl 
	{
		private var tank:Tank;
		// полоса по которой едет танк
		private var numLine:int = 0;
		
		private var positions:Vector.<int>;
		
		public var isTurning:Boolean = false;
		
		private var isTurningLeft:Boolean = false;
		private var isTurningRight:Boolean = false;
		
		public function TankControl(tank:Tank) 
		{
			this.tank = tank;
			positions = new Vector.<int>();
			positions.push(90);
			positions.push(180);
			positions.push(270);
			positions.push(360);
			
			tank.x = positions[1];
			numLine = 1;
		}
		
		public function update():void {
			if (!isTurning) {
				if (AntG.keys.isPressed("LEFT") && numLine > 0) {
					isTurning = true;
					isTurningLeft = true;
					
				} else if (AntG.keys.isPressed("RIGHT") && numLine < 3) {
					isTurning = true;
					isTurningRight = true;
				}
			}
			
			if (isTurning && isTurningLeft) {
				tank.x -= tank.reaction;
				tank.angle = -tank.angleReaction;
				// танк завершил поворот
				if (tank.x <= positions[numLine-1]) {
					tank.angle = 0;
					tank.x = positions[numLine-1];
					numLine--;
					isTurning = false;
					isTurningLeft = false;
				}
			}
			
			if (isTurning && isTurningRight) {
				tank.x += tank.reaction;
				tank.angle = +tank.angleReaction;
				// танк завершил поворот
				if (tank.x >= positions[numLine+1]) {
					tank.angle = 0;
					tank.x = positions[numLine+1];
					numLine++;
					isTurning = false;
					isTurningRight = false;
				}
			}
			
		}
		
	}

}