package engine.classes 
{
	import engine.IGameEventsHandler;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class GameState extends Sprite implements IGameEventsHandler
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
		
		public function sendGameEvent(eventName:String):void 
		{
			dispatchEventWith( eventName, true );			
		}
		
		public function registerGameEvent(eventName:String):void 
		{
			this.addEventListener( eventName, onGameEvent );			
		}
		
		public function onGameEvent(e:Event):void 
		{
			
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