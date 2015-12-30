package towers.states.lobby
{
	import engine.classes.GameState;
	import engine.mods.starlingbuilder.AssetMediator;
	import engine.Utils;
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starlingbuilder.engine.UIBuilder;
	import towers.AppCore;
	import towers.enums.GameEvents;
	import towers.states.lobby.screens.ScreenAppOptions;
	import towers.states.lobby.screens.ScreenStart;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class StateLobby extends GameState
	{	
		private var mButtonGroup:ButtonGroup;		
		private var mScrStart:ScreenStart;
		
		private var mBackground:Image;
		private var mScreenContainer:Sprite;
		
		public function StateLobby()
		{
			super();		
		}
		
		override protected function update(event:EnterFrameEvent):void 
		{
			super.update(event);
		}
		
		override protected function mount():void 
		{
			super.mount();
			
			initHierarchy();
			showStart();
			
			registerGameEvent( GameEvents.SHOW_APP_OPTIONS );
			registerGameEvent( GameEvents.SHOW_START );
			
			onMountSuccess();
		}
		
		override protected function dismount():void 
		{
			super.dismount();
		}
		
		override public function onGameEvent(e:Event):void 
		{
			switch( e.type )
			{
				case GameEvents.SHOW_APP_OPTIONS:	
					showOptions();
					break;
				case GameEvents.SHOW_START:
					showStart();
					break;
			}
		}
		
		private function initHierarchy() : void
		{
			if ( mBackground == null )
			{
				mBackground = new Image( AppCore.getInstance().getAssetMngr().getTexture( "wizard_tower_art_1" ) );
				mBackground.alignPivot();
				Utils.setToCenter( mBackground );
				this.addChildAt( mBackground, 0 );				
			}
			
			if ( mScreenContainer == null )
			{
				mScreenContainer = new Sprite();
				this.addChildAt( mScreenContainer, 1 );
			}			
		}
		
		private function showStart() : void
		{
			var start:ScreenStart = new ScreenStart();
			start.show( true, mScreenContainer );
		}
		
		private function showOptions() : void
		{
			var options:ScreenAppOptions = new ScreenAppOptions();
			options.show( true, mScreenContainer );			
		}
	
	}

}