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
			
			new MetalWorksDesktopTheme();
			
			mButtonGroup = new VDButtonGroup();
			this.addChild( mButtonGroup );
			
			mButtonGroup.dataProvider = new ListCollection(
			[
				{ name: "mBtnOption1", label: "Option #1", triggered: buttonHandler },
				{ name: "mBtnBack",	   label: "Zurück", triggered: buttonHandler }
			] );
			
			//the button won't have a width and height until it "validates". it
			//will validate on its own before the next frame is rendered by
			//Starling, but we want to access the dimension immediately, so tell
			//it to validate right now.
			mButtonGroup.validate();

			//center the button
			mButtonGroup.x = Math.round((this.stage.stageWidth - mButtonGroup.width) / 2);
			mButtonGroup.y = Math.round((this.stage.stageHeight - mButtonGroup.height) / 2) + 50;
			
			onMountSuccess();
		}		
		
		
		private function buttonHandler( event:Event ):void
		{
			var button:Button = Button( event.currentTarget );
			
			switch( button.name )
			{
				case "mBtnOption1":
					break;
				case "mBtnBack":
					sendGameEvent( GameEvents.SHOW_START );
					dismount();
					break;
			}
		}
		
	}

}