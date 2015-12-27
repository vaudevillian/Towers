package towers.states
{
	import engine.classes.GameState;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class StateLobby extends GameState
	{
		
		public function StateLobby()
		{
			super();		
		}
		
		override protected function update(event:EnterFrameEvent):void 
		{
			trace( "Lobby" );
			super.update(event);
		}
	
	}

}