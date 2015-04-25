package {
 
	import citrus.objects.CitrusSprite;
 
	public class HeroTest extends CitrusSprite {
 
		public var accelerationX:Number = 200;
		public var accelerationY:Number = 100;
 
		public var inputChannel:uint = 0;
 
		public function HeroTest(name:String, params:Object = null) {
			super(name, params);
			
		}
 
		override public function update(timeDelta:Number):void {
 
			super.update(timeDelta);
 
			if (_ce.input.isDoing("right", inputChannel))
				_velocity.x = accelerationY;
 
			if (_ce.input.isDoing("left", inputChannel))
				_velocity.x = -accelerationX;
 
			if (_ce.input.hasDone("left", inputChannel) || _ce.input.hasDone("right", inputChannel))
				_velocity.x = 0;
 
			if (_ce.input.isDoing("up", inputChannel))
				_velocity.y = -accelerationY;
 
			if (_ce.input.isDoing("down", inputChannel))
				_velocity.y = accelerationY;
 
			if (_ce.input.hasDone("up", inputChannel) || _ce.input.hasDone("down", inputChannel))
				_velocity.y = 0;
 
 
		}
 
	}
}