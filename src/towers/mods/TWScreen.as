package towers.mods
{
	import engine.classes.Screen;
	import engine.IGameEventsHandler;
	import feathers.controls.Button;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import towers.AppCore;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class TWScreen extends Screen implements IGameEventsHandler
	{
		protected var mAssets:TWAssetManager;		
		protected var mUIBuilder:TWUIBuilder;
		protected var mFilenameScreen:String;
		
		public function TWScreen()
		{
			super();
			mAssets = AppCore.getInstance().getAssetMngr();
			mUIBuilder = AppCore.getInstance().getUIBuilder();
		}
		
		public function downloadScreen( name:String ) : void
		{
			mFilenameScreen = name;
			
			function onProgress( progress:Number ) : void
			{
				if ( progress == 1.00 )
				{
					onDownloadScreenSuccess();
				}
			}
			
			mAssets.enqueueScreen( name );
			mAssets.loadQueue( onProgress );
		}
		
		protected function onDownloadScreenSuccess() : void
		{					
			var screen:Sprite = mUIBuilder.createScreen( this, mAssets.getScreen( mFilenameScreen ) );
			addChild( screen );				
		}
		
		public function downloadTextures() : void
		{
			
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
		
		public function setScreenDefault( obj:Object, data:Object ):void 
		{
			if ( obj is Button ) 
			{
				Button( obj ).addEventListener( Event.TRIGGERED, onButtonTriggered ); 
			}
		}
		
		protected function onButtonTriggered( event:Event ) : void
		{
		}
		
	
	}

}