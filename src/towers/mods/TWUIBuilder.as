package towers.mods 
{
	import starling.display.Sprite;
	import starlingbuilder.engine.IAssetMediator;
	import starlingbuilder.engine.localization.ILocalization;
	import starlingbuilder.engine.UIBuilder;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class TWUIBuilder extends UIBuilder 
	{
		
		public function TWUIBuilder(assetMediator:IAssetMediator, forEditor:Boolean=false, template:Object=null, localization:ILocalization=null) 
		{
			super(assetMediator, forEditor, template, localization);	
			_factory = new TWUIElementFactory(assetMediator, forEditor); 
		}
		
		public function setDefaultCallback( callback:Function ) : void
		{
			TWUIElementFactory( _factory ).setDefaultCallback( callback );			
		}
		
		override public function create(data:Object, trimLeadingSpace:Boolean = true):Object 
		{
			return super.create(data, trimLeadingSpace);
		}
		
		public function createScreen( screen:TWScreen, data:Object ) : Sprite
		{
			setDefaultCallback( screen.setScreenDefault );
			var sprite:Sprite = create( data, false ) as Sprite;
			setDefaultCallback( null )
			return sprite;			
		}
		
	}

}