package towers.states.lobby
{
	import engine.classes.GameState;
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
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
		
		private function showStart() : void
		{
			var start:ScreenStart = new ScreenStart();
			start.show( true, this );
		}
		
		private function showOptions() : void
		{
			var options:ScreenAppOptions = new ScreenAppOptions();
			options.show( true, this );			
		}
	
	}

}