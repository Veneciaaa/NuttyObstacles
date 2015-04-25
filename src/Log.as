package {
	import citrus.view.ISpriteView;
	import Box2D.Dynamics.Contacts.b2Contact;

	import citrus.math.MathVector;
	import citrus.objects.CitrusSprite;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.physics.box2d.IBox2DPhysicsObject;

	import org.osflash.signals.Signal;

	import flash.utils.Dictionary;

	public class Log extends CitrusSprite{
		
		public static const LOG_LEFT: Number = 0;
		public static const LOG_RIGHT: Number = 1;
		public static const LOG_SPEED = 70;
		public static const LOG_WIDTH = 64;
		public static const LOG_HEIGHT =32;
		
		private var direction: Number;
		
		public function Log(direction: int, name:String, params:Object = null){
			super(name,params);
			
			this.direction = direction;
			
			if (direction == LOG_RIGHT) //right
				_velocity.x = LOG_SPEED;
			else
				_velocity.x = -LOG_SPEED;
		}

		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			
			//respawn on the other side
			if (direction == LOG_LEFT)
			{
				if(x < -50)
					x= 390;
			}
			
			if(direction == LOG_RIGHT)
			{
				if(x > 390)
					x = -50;
			}
		}
		
		public function getSpeed():int{
			return _velocity.x;
		}
		
	}
}
