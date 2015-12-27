package 
{
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import towers.AppCore;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class StarlingMain extends Sprite 
	{
		
		public function StarlingMain() 
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);			
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);	
			AppCore.getInstance().setRootContainer( this );
			AppCore.getInstance().init();
		}
		
	}

}