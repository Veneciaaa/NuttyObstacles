package {
	import citrus.objects.CitrusSprite;

	import flash.display.Bitmap;

	public class MainCharacter extends CitrusSprite {
		public var inputChannel : uint = 0;
		private var movingRight : Boolean;
		private var movingLeft : Boolean;
		private var movingUp : Boolean;
		private var movingDown : Boolean;
		private var accelerationX : Number = 300;
		private var accelerationY : Number = 300;
		public static const MAIN_WIDTH = 32;
		public static const MAIN_HEIGHT = 32;
		public static var colliding : Boolean;
		[Embed(source="RES/Squirrel1_1.png")]
		private var Squirrel1_1 : Class;
		var squirrel1_1 : Bitmap = new Squirrel1_1();
		[Embed(source="RES/Squirrel1_2.png")]
		private var Squirrel1_2 : Class;
		var squirrel1_2 : Bitmap = new Squirrel1_2();
		[Embed(source="RES/Squirrel1_3.png")]
		private var Squirrel1_3 : Class;
		var squirrel1_3 : Bitmap = new Squirrel1_3();
		[Embed(source="RES/Squirrel1_4.png")]
		private var Squirrel1_4 : Class;
		var squirrel1_4 : Bitmap = new Squirrel1_4();
		[Embed(source="RES/Squirrel1_5.png")]
		private var Squirrel1_5 : Class;
		var squirrel1_5 : Bitmap = new Squirrel1_5();
		[Embed(source="RES/Squirrel1_6.png")]
		private var Squirrel1_6 : Class;
		var squirrel1_6 : Bitmap = new Squirrel1_6();
		var vel : Number = 800;
		var accel : Number = 400;
		var counter : Number = 0;

		public function MainCharacter(name : String, params : Object = null) {
			super(name, params);

			colliding = false;
			movingRight = false;
			movingLeft = false;
			movingUp = false;
			movingDown = false;
		}

		override public function update(timeDelta : Number) : void {
			super.update(timeDelta);

			if ((x < 0) || (x > 216)) {
				restart();
			} else if (y > 360) {
				restart();
			}
			if (_ce.input.isDoing("right", inputChannel)) {
				if (counter == 0) {
					view = squirrel1_4;
					x += MAIN_HEIGHT;
					counter++;
				} else {
					counter++;
					if (counter > 5) {
						counter = 0;
					}
				}
			}
			if (_ce.input.isDoing("left", inputChannel)) {
				if (counter == 0) {
					inverted = true;
					view = squirrel1_4;
					x -= MAIN_HEIGHT;
					counter++;
				} else {
					counter++;
					if (counter > 5) {
						counter = 0;
					}
				}
			}
			if (_ce.input.isDoing("up", inputChannel)) {
				if (counter == 0) {
					y -= MAIN_HEIGHT;
					inverted = false;
					view = squirrel1_1;
					counter++;
				} else {
					counter++;
					if (counter > 5) {
						counter = 0;
					}
				}
			}
			if (_ce.input.isDoing("down", inputChannel)) {
				if (counter == 0) {
					y += MAIN_HEIGHT;
					inverted = true;
					view = squirrel1_1;
					counter++;
				} else {
					counter++;
					if (counter > 5) {
						counter = 0;
					}
				}
			}
			/**
			if (_ce.input.isDoing("right",inputChannel)){
			
			if (movingRight == false){
			movingRight = true;
			inverted = false;
			view = squirrel1_4;
			_velocity.x = vel;
			}
			}
			if (_ce.input.isDoing("left",inputChannel)){
			if (movingLeft == false){
			movingLeft = true;
			inverted = true;
			view = squirrel1_4;
			_velocity.x = -vel;
			}
			}
			if (_ce.input.isDoing("up",inputChannel)){
			if (movingUp == false){
			movingUp = true;
			inverted = false;
			view = squirrel1_1;
			_velocity.y = -vel;
			}
			}
			if (_ce.input.isDoing("down",inputChannel)){
			if (movingDown == false){
			movingDown = true;
			inverted = true;
			view = squirrel1_1;
			_velocity.y = vel;
			}
			}
			 */

			if (colliding == false) {
				_velocity.x = 0;
			}
		}

		public function changeVelocity(speed : int) : void {
			_velocity.x = speed;
		}

		public function restart() : void {
			colliding = false;
			x = 90;
			y = 355;
		}
	}
}