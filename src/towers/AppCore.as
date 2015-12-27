package towers 
{
	import engine.classes.LeafInit;
	import starling.display.DisplayObjectContainer;
	import starling.events.EnterFrameEvent;
	import towers.enums.AppStates;
	import towers.states.StateLobby;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class AppCore extends LeafInit
	{
		private static var mInstance:AppCore;
		
		private var mRootContainer:DisplayObjectContainer;
		private var mAppState:String = AppStates.NONE;
		private var mStateLobby:StateLobby;

		public static function getInstance():AppCore 
		{
			if (mInstance == null)
			{
				mInstance = new AppCore( new SingletonEnforcer() );
			}
			return mInstance;
		}		
		
		public function AppCore (e:SingletonEnforcer):void
		{
		
		}
		
		public function setRootContainer( root:DisplayObjectContainer ) : void
		{
			mRootContainer = root;
		}
		
		override public function init(onInitFinished:Function = null):void 
		{
			super.init(onInitFinished);
			
			if ( mRootContainer == null )
			{
				trace( "Define root container" );
				return;
			}			
			
			mRootContainer.addEventListener(EnterFrameEvent.ENTER_FRAME, update);
		}
		
		private function update(e:EnterFrameEvent):void 
		{
			checkGameState();
		}
		
		private function checkGameState() : void
		{
			if ( mAppState == AppStates.NONE )
			{
				switchToGameState( AppStates.LOBBY );
			}
		}
		
		private function switchToGameState( state:String ):void 
		{
			if ( mAppState == state )
			{
				// No game state change registered.
				return;
			}
			
			switch( state )
			{
				case AppStates.LOBBY:
					mStateLobby ||= new StateLobby();
					mStateLobby.activate( true, mRootContainer );
					break;
				default:
					
			}
			
			mAppState = state;			
		}
		

		
	}
}

class SingletonEnforcer {}