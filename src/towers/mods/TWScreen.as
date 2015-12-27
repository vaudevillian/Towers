package towers.mods
{
	import engine.classes.Screen;
	import engine.IGameEventsHandler;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class TWScreen extends Screen implements IGameEventsHandler
	{
		
		public function TWScreen()
		{
			super();
		}
		
		public function sendGameEvent(eventName:String):void
		{
			dispatchEventWith(eventName, true);
		}
		
		public function onGameEvent(e:Event):void
		{
		
		}
		
		public function registerGameEvent(eventName:String):void
		{
			this.addEventListener(eventName, onGameEvent);
		}
		
		override protected function onMountSuccess():void
		{
			super.onMountSuccess();
			
			this.alpha = 0.00;
			var tween:Tween = new Tween( this, 0.5, Transitions.EASE_IN );
			tween.fadeTo( 1.00 );		
			Starling.juggler.add( tween );
		}
		
		override protected function dismount():void 
		{
			var tween:Tween = new Tween( this, 0.5, Transitions.EASE_IN );
			tween.fadeTo( 0.00 );	
			tween.onComplete = super.onDismountSuccess
			Starling.juggler.add( tween );
		}
		
	
	}

}