package {
	import citrus.core.starling.StarlingState;
	import citrus.input.controllers.displaylist.VirtualJoystick;
	import citrus.math.MathVector;
	import citrus.objects.CitrusSprite;
	import citrus.physics.box2d.Box2D;
	import citrus.physics.simple.SimpleCitrusSolver;
	import citrus.utils.Mobile;
	import citrus.view.ACitrusCamera;
	import citrus.view.spriteview.SpriteCamera;
	import citrus.view.starlingview.StarlingCamera;

	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author dusti_000
	 */
	public class StarlingDemoGameState extends StarlingState {
		public function StarlingDemoGameState() {
			super();
		}

		[Embed(source="Level.png")]
		private var Level : Class;
		var level : Bitmap = new Level();
		
		[Embed(source="RES/Car.png")]
		private var Car : Class;
		var car: Bitmap = new Car();
		
		[Embed(source="RES/Log.png")]
		private var Logg :Class;
		var log: Bitmap = new Logg();
		
		[Embed(source="RES/Alligator_angry.png")]
		private var aAlligator: Class;
		var angryalligator : Bitmap = new aAlligator();
		
		[Embed(source="RES/Alligator_peace.png")]
		private var pAlligator: Class;
		var peacealligator : Bitmap = new pAlligator();
		
		[Embed(source="RES/Bike.png")]
		private var Bike : Class;
		var bike: Bitmap = new Bike();
		
		[Embed(source="RES/Bus.png")]
		private var Bus : Class;
		var bus: Bitmap = new Bus();
		
		[Embed(source="RES/Swan_down.png")]
		private var dSwan: Class;
		var dswan:Bitmap = new dSwan();
		
		[Embed(source="RES/Swan_up.png")]
		private var uSwan: Class;
		var uswan:Bitmap = new uSwan();
		
		[Embed(source="RES/Squirrel1_1.png")]
		private var Squirrel1_1: Class;
		var squirrel1_1:Bitmap = new Squirrel1_1();
		
		[Embed(source="RES/Squirrel1_2.png")]
		private var Squirrel1_2: Class;
		var squirrel1_2:Bitmap = new Squirrel1_2();
		
		[Embed(source="RES/Squirrel1_3.png")]
		private var Squirrel1_3: Class;
		var squirrel1_3:Bitmap = new Squirrel1_3();
		
		[Embed(source="RES/Squirrel1_4.png")]
		private var Squirrel1_4: Class;
		var squirrel1_4:Bitmap = new Squirrel1_4();
		
		[Embed(source="RES/Squirrel1_5.png")]
		private var Squirrel1_5: Class;
		var squirrel1_5:Bitmap = new Squirrel1_5();
		
		[Embed(source="RES/Squirrel1_6.png")]
		private var Squirrel1_6: Class;
		var squirrel1_6:Bitmap = new Squirrel1_6();
		
		[Embed(source="RES/Squirrel1_drown.png")]
		private var drSquirrel1: Class;
		var drsquirrel1:Bitmap = new drSquirrel1();
		
		[Embed(source="RES/Squirrel1_rdeath.png")]
		private var rDeSquirrel1: Class;
		var rdesquirrel1:Bitmap = new rDeSquirrel1();
		
		[Embed(source="RES/Squirrel1_udeath.png")]
		private var uDeSquirrel1: Class;
		var udesquirrel1:Bitmap = new uDeSquirrel1();
		
		
		override public function initialize() : void {
			super.initialize();
			if (Mobile.isIOS() || Mobile.isAndroid()) {
				var vj : VirtualJoystick = new VirtualJoystick("joy");
			}
			var _camera : SpriteCamera;

			// camera.allowZoom = true;
			// camera.zoomFit(224,384,true);
			// camera
			// camera.zoom(2);
			var box2D : Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);

			var solver : SimpleCitrusSolver = new SimpleCitrusSolver("solver", MainCharacter);
			add(solver);
			solver.overlap(MainCharacter, Obstacle);
			solver.collide(MainCharacter, Water);
			solver.overlap(MainCharacter, Log);
			solver.overlap(MainCharacter, Background);

			// y:384
			// x: 224

			var background : Background = new Background("ISU", {x:0, y:0, width:216, height:384, updateCallEnabled:true, view:level});
			add(background);

			var lake : Water = new Water("Lake Laverne", {x:0, y:50, width:224, height:50, updateCallEnabled:true});
			add(lake);
			
			var cyclist1: Obstacle = new Obstacle(Obstacle.OBSTACLE_RIGHT, "Mike", {x:500, y:150, width:32, height:32, updateCallEnabled:true, view:bike});
			add(cyclist1);
			
			var obstacle : Obstacle = new Obstacle(Obstacle.OBSTACLE_RIGHT, "Car1", {x:100, y:190, width:60, height:45, updateCallEnabled:true, view:car});
			add(obstacle);
			
			var bus1: Obstacle = new Obstacle(Obstacle.OBSTACLE_RIGHT, "Bus1", {x:500, y:190, width:32, height:32, updateCallEnabled:true, view:bus});
			add(bus1);
			
			var log1 : Log = new Log(Log.LOG_LEFT, "Loggy", {x:200, y:300, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true, view:log});
			add(log1);

			var log2 : Log = new Log(Log.LOG_RIGHT, "Logger", {x:10, y:280, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true, view:log});
			add(log2);

			var log3 : Log = new Log(Log.LOG_LEFT, "Logathan", {x:15, y:300, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true, view:log});
			add(log3);

			var log4 : Log = new Log(Log.LOG_RIGHT, "Loggo", {x:10, y:320, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true, view:log});
			add(log4);
			
			var swan1 : Swan = new Swan(Log.LOG_RIGHT, "Lancelot", {x:160, y:280, width:32, height:32, updateCallEnabled:true, view: uswan});
			add(swan1);

			var alligator1 : Alligator = new Alligator(Log.LOG_LEFT, "Franklin", {x:155, y:300, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true, view:peacealligator});
			add(alligator1);

			var mainCharacter : MainCharacter = new MainCharacter("Bob", {x:90, y:355, width:MainCharacter.MAIN_WIDTH, height:MainCharacter.MAIN_HEIGHT, updateCallEnabled:true, view:squirrel1_1});
			add(mainCharacter);


			mainCharacter.onCollide.add(_collisionStart);
			// target:Object, bounds:Rectangle = null, center:Point = null, easing:Point = nul
			// _camera = view.camera.setUp(background,new Rectangle(224,384), new Point(224/2,384/2)) as SpriteCamera;
			// _camera.allowZoom = true;
			// _camera.zoomFit(224,384);
			// _camera = view.camera as SpriteCamera;
			// _camera.setUp(mainCharacter,new Rectangle(0,0,224,384), new Point(0.5, 0.5), new Point(0.05, 0.05));
			// _camera.allowRotation = true;
			// _camera.allowZoom = true;
			// _camera.deadZone = new Rectangle(0, 0, 2*stage.stageWidth/3, stage.stageHeight/3);
			// _camera.parallaxMode = ACitrusCamera.PARALLAX_MODE_DEPTH;
			// _camera.boundsMode = ACitrusCamera.BOUNDS_MODE_AABB;

			// _camera.setZoom(5);
			// _camera.reset();

			// _camera.target = mainCharacter;
			// view.camera.enabled = true;
			// view.camera.zoom(2);
			view.camera.enabled = true;
			//_camera = view.camera as SpriteCamera;
		//	_camera.enabled = true;
			// a reference for future use

			view.camera.setUp(background, null, new Point(0.5, 0.5));

			view.camera.bounds = new Rectangle(0, 0, 200000, 200000);
			//_camera.allowRotation = true;
			view.camera.allowZoom = true;
			//_camera.easing.setTo(1, 1);
			//_camera.rotationEasing = 1;
		//	_camera.zoomEasing = 1;
			view.camera.zoomFit(216, 384, true);
			view.camera.reset();
			  
			 
			
		
		}

		private function _collisionStart(self : CitrusSprite, other : CitrusSprite, normal : MathVector, impact : Number) : void {
			var obj : MainCharacter = MainCharacter(self);

			if ((other is Water) || (other is Obstacle)) {
				// Obstacle or water
				obj.restart();
				trace("dead squirrel :(");
			} else if (other is Log) {
				// Log, Swan, or Alligator
				MainCharacter.colliding = true;
				if (other is Alligator) {
					// Alligator
					var obj2 : Alligator = Alligator(other);
					if (obj2.isEnemy == true) {
						// kill if enemy
						obj.restart();
						trace("died via enemy alligator");
					} else {
						// ride alligator if friendly
						obj.changeVelocity(obj2.getSpeed());
						trace("riding friendly alligator");
					}
				} else if (other is Swan) {
					// Swan
					var obj3 : Swan = Swan(other);
					if (obj3.underwater == true) {
						// kill if Swan is underwater
						obj.restart();
						trace("died via underwater Swan");
					} else {
						// ride floating swan
						obj.changeVelocity(obj3.getSpeed());
						trace("riding floating swan");
					}
				} else {
					// just a log
					var obj4 : Log = Log(other);
					obj.changeVelocity(obj4.getSpeed());
					trace("just riding a log:)");
				}
			} else if (other is Background) {
				// Background
				MainCharacter.colliding = false;
				trace("just chillin");
			}
		}
	}
}
