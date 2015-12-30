package engine 
{
	import starling.display.DisplayObject;
	import starling.display.Stage;
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class Utils 
	{
		
		public static var stage:Stage;
		
		public static function setToCenter( object:DisplayObject ) : void
		{
			if ( stage == null )
			{
				return;
			}
			
			object.x = stage.stageWidth * 0.5;
			object.y = stage.stageHeight * 0.5;
		}
		
	}

}