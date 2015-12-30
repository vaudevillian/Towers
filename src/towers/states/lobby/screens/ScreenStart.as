package towers.states.lobby.screens 
{
	import engine.classes.Screen;
	import engine.mods.feathers.controls.VDButtonGroup;
	import engine.mods.starlingbuilder.AssetMediator;
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.display.Sprite;
	import starling.events.Event;
	import starlingbuilder.engine.UIBuilder;
	import towers.enums.GameEvents;
	import towers.mods.TWScreen;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class ScreenStart extends TWScreen 
	{
		private var mButtonGroup:VDButtonGroup;
		
		public function ScreenStart() 
		{
			super();			
		}
		
		override protected function mount():void 
		{
			super.mount();			
			downloadScreen( "ScrLobbyStart.json" );
		}	
		
		override protected function onDownloadScreenSuccess():void 
		{
			super.onDownloadScreenSuccess();				
			onMountSuccess();		
		}
		
		override protected function onButtonTriggered(event:Event):void 
		{
			//Event.TRIGGERED
			var button:Button = Button( event.currentTarget );
			
			switch( button.name )
			{
				case "mBtnStart":
					break;
				case "mBtnOptions":
					sendGameEvent( GameEvents.SHOW_APP_OPTIONS );
					dismount();
					break;
			}
		}
		
	}

}