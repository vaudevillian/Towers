package towers 
{
	import engine.classes.LeafInit;
	import engine.mods.starlingbuilder.AssetMediator;
	import engine.Utils;
	import feathers.themes.MetalWorksDesktopTheme;
	import feathers.themes.MetalWorksDesktopThemeWithAssetManager;
	import starling.display.DisplayObjectContainer;
	import starling.events.EnterFrameEvent;
	import towers.enums.AppStates;
	import towers.mods.TWAssetManager;
	import towers.mods.TWUIBuilder;
	import towers.states.lobby.StateLobby;
	import towers.themes.towersStandard.TowersTheme;
	
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
		private var mAssetManager:TWAssetManager;
		private var mUIBuilder:TWUIBuilder;

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
			
			Utils.stage = mRootContainer.stage;
			
			
			mAssetManager = new TWAssetManager();
			//new MetalWorksDesktopThemeWithAssetManager( "assets/", mAssetManager );
			new TowersTheme();
			mUIBuilder = new TWUIBuilder( new AssetMediator( mAssetManager ) );
			
			mAssetManager.enqueueBackground( "wizard_tower_art_1.jpg" );
			mAssetManager.enqueueTexture( "ui.png", true );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size18_ColorFFFFFF_StrokeA8364B.fnt" );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size18_ColorFFFFFF_StrokeA8364B.png" );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size36_ColorFFFFFF.fnt" );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size36_ColorFFFFFF.png" );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size36_ColorFFFFFF_StrokeA8364B.fnt" );
			mAssetManager.enqueueFont( "GrilledCheeseBTN_Size36_ColorFFFFFF_StrokeA8364B.png" );
			mAssetManager.enqueueFont( "LobsterTwoRegular_Size54_ColorFFFFFF_StrokeAF384E_DropShadow560D1B.fnt" );
			mAssetManager.enqueueFont( "LobsterTwoRegular_Size54_ColorFFFFFF_StrokeAF384E_DropShadow560D1B.png" );			
			
			
			function onProgress( progress:Number ) : void
			{
				if ( progress == 1.00 )
				{
					finishInit();
				}
			}
			mAssetManager.loadQueue( onProgress );			
		}
		
		override protected function finishInit():void 
		{
			mRootContainer.addEventListener(EnterFrameEvent.ENTER_FRAME, update);
			super.finishInit();
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
		
		public function getAssetMngr() : TWAssetManager
		{
			return mAssetManager;		
		}
		
		public function getUIBuilder() : TWUIBuilder
		{
			return mUIBuilder;
		}
		

		
	}
}

class SingletonEnforcer {}