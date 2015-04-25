package {
	import flash.display.Bitmap;
	/**
	 * @author veneciaalvarez
	 */
	public class Swan extends Log {
		var underwater: Boolean;
		
		[Embed(source="RES/Swan_down.png")]
		private var dSwan: Class;
		var dswan:Bitmap = new dSwan();
		
		[Embed(source="RES/Swan_up.png")]
		private var uSwan: Class;
		var uswan:Bitmap = new uSwan();
		
		public function Swan(direction : int, name : String, params : Object = null) {
			super(direction, name, params);
			if(direction==LOG_RIGHT){
				inverted=true;
			}
			underwater = false;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			//Randomly disappear
			var randNum:Number=Math.floor(Math.random()*100)+1; //1-100
			
			if (!underwater)
			{
				if (randNum == 1)
				{
					swim();
				}
			}
			else if (underwater)
			{
				if (randNum < 3)
				{
					swim();
				}
			}
		
			
		}
		
		private function swim(): void{
			
			if (!underwater) //go under water
			{
				underwater = true;
				//change sprite to bubbles?
				view = dswan;
				trace("I'm underwater, fear me!");
			}
			else //go above water
			{
				underwater = false;
				view = uswan;
				//change spritie to swan
				trace("I'm floating, hop on!");
			}
		}
	}
}
