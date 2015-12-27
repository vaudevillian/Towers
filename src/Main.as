package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;

	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		private var mStarling:Starling;

		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			mStarling = new Starling(StarlingMain, stage);
			mStarling.antiAliasing = 1;
			mStarling.start();
		}

	}

}