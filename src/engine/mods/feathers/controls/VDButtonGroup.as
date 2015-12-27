package engine.mods.feathers.controls 
{
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class VDButtonGroup extends ButtonGroup 
	{
		
		/**
		 * @private
		 */
		protected static const LABEL_NAME:String = "name";
		
		public function VDButtonGroup() 
		{
			super();		
			this.buttonInitializer = modifiedButtonInitializer;
		}
		
		/**
		 * @private
		 */
		protected function modifiedButtonInitializer(button:Button, item:Object):void
		{
			if(item is Object)
			{
				if ( item.hasOwnProperty( LABEL_NAME ) )
				{
					button.name = item.name as String;
				}
			}
			
			defaultButtonInitializer( button, item );
		}
		
	}

}