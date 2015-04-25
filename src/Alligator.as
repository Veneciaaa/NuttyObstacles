package {
	import flash.display.Bitmap;
	/**
	 * @author veneciaalvarez
	 */
	public class Alligator extends Log {
		
		public static const ALL_WIDTH: int = 130;
		public static const ALL_HEIGHT: int = 35;
		var isEnemy: Boolean;
		
		[Embed(source="RES/Alligator_angry.png")]
		private var aAlligator: Class;
		var angryalligator : Bitmap = new aAlligator();
		
		[Embed(source="RES/Alligator_peace.png")]
		private var pAlligator: Class;
		var peacealligator : Bitmap = new pAlligator();
		
		public function Alligator(direction : int, name : String, params : Object = null) {
			super(direction, name, params);
			if(direction==LOG_LEFT){
				inverted=true;
			}
			isEnemy = false;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			//Randomly open mouth
			var randNum:Number=Math.floor(Math.random()*100)+1; //1-100
			
			if (!isEnemy)
			{
				if (randNum == 1)
				{
					moveMouth();
				}
			}
			else if (isEnemy)
			{
				if (randNum < 3)
				{
					moveMouth();
				}
			}
		
			
		}
		
		private function moveMouth(): void{
			if (!isEnemy) //open mouth
			{
				isEnemy = true;
				//change sprite to open mouth
				view = angryalligator;
				trace("I'm an enemy alligator!");
			}
			else //close mouth& turn to enemy
			{
				isEnemy = false;
				//change spritie to closed mouth
				view=peacealligator;
				trace("I'm a friendly alligator!");
			}
		}
	}
	
}
