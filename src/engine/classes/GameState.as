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
				mount();
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
		
		protected function mount() : void
		{
			this.visible = false;
		}
		
		protected function onMountSuccess() : void
		{
			this.visible = true;
		}
		
		protected function dismount() : void
		{
			
		}
		
		protected function onDismountSuccess() : void
		{
			
		}
		
	}

}