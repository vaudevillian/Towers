package towers.states.lobby.screens 
{
	import engine.classes.Screen;
	import engine.mods.feathers.controls.VDButtonGroup;
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.events.Event;
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
			
			new MetalWorksDesktopTheme();
			
			mButtonGroup = new VDButtonGroup();
			this.addChild( mButtonGroup );
			
			mButtonGroup.dataProvider = new ListCollection(
			[
				{ name: "mBtnStart", label: "Start Game", triggered: buttonHandler },
				{ name: "mBtnOptions", label: "Options", triggered: buttonHandler }
			] );
			
			//the button won't have a width and height until it "validates". it
			//will validate on its own before the next frame is rendered by
			//Starling, but we want to access the dimension immediately, so tell
			//it to validate right now.
			mButtonGroup.validate();

			//center the button
			mButtonGroup.x = Math.round((this.stage.stageWidth - mButtonGroup.width) / 2);
			mButtonGroup.y = Math.round((this.stage.stageHeight - mButtonGroup.height) / 2);
			
			onMountSuccess();
		}		
		
		
		private function buttonHandler( event:Event ):void
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