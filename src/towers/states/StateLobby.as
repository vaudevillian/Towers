package towers.states
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
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class StateLobby extends GameState
	{
		
		private var mButtonGroup:ButtonGroup;
		
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
			
			new MetalWorksDesktopTheme();
			
			mButtonGroup = new ButtonGroup();
			this.addChild( mButtonGroup );
			
			mButtonGroup.dataProvider = new ListCollection(
			[
				{ label: "Start Game", triggered: buttonHandler },
				{ label: "Options", triggered: buttonHandler }
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
			trace( "button triggered:", button.label );
		}
		
		override protected function dismount():void 
		{
			super.dismount();
			
			
		}
	
	}

}