package towers.states.lobby.screens 
{
	import engine.mods.feathers.controls.VDButtonGroup;
	import feathers.controls.Button;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.events.Event;
	import towers.enums.GameEvents;
	import towers.mods.TWScreen;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class ScreenAppOptions extends TWScreen 
	{
		private var mButtonGroup:VDButtonGroup;
		
		public function ScreenAppOptions() 
		{
			super();
			
		}
		
		override protected function mount():void 
		{
			super.mount();
			downloadScreen( "ScrLobbyOptions.json" );
		}
		
		override protected function onDownloadScreenSuccess():void 
		{
			super.onDownloadScreenSuccess();
			onMountSuccess();
		}
		
		override protected function onButtonTriggered(event:Event):void 
		{
			var button:Button = Button( event.currentTarget );
			
			switch( button.name )
			{
				case "mBtnBack":
					sendGameEvent( GameEvents.SHOW_START );
					dismount();
					break;
			}
		}
		
	}

}