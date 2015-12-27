package engine.classes 
{
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class GameState extends Sprite 
	{
		
		public function GameState() 
		{
			super();			
		}
		
		
		public function activate( activate:Boolean, parent:DisplayObjectContainer = null):void
		{
			if ( activate )
			{
				parent.addChild( this );
				this.addEventListener(EnterFrameEvent.ENTER_FRAME, update);				
			}
			else
			{
				this.removeFromParent();
				this.removeEventListener(EnterFrameEvent.ENTER_FRAME, update);		
			}		
		}		
		
		protected function update(event:EnterFrameEvent):void
		{
			
		}
		
	}

}