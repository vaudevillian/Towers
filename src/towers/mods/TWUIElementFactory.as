package towers.mods 
{
	import feathers.controls.Button;
	import starlingbuilder.engine.IAssetMediator;
	import starlingbuilder.engine.UIElementFactory;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class TWUIElementFactory extends UIElementFactory 
	{
		private var _customSetDefault:Function;
		
		public function TWUIElementFactory(assetMediator:IAssetMediator, forEditor:Boolean=false) 
		{
			super(assetMediator, forEditor);
		}
		
		public function setDefaultCallback( func:Function ) : void
		{
			_customSetDefault = func;
		}
		
		override protected function setDefault(obj:Object, data:Object):void 
		{
			super.setDefault(obj, data);
			
			if ( _customSetDefault != null )
			{
				_customSetDefault( obj, data );
			}
		}
		
		//override protected function setDefault(obj:Object, data:Object):void 
		//{
			//super.setDefault(obj, data);
			//
			//if ( obj is Button )
			//{
				//Button( obj ).addEventListener(
			//}
		//}
		
	}

}