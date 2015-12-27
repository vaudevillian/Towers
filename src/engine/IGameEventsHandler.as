package engine 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public interface IGameEventsHandler 
	{
		function sendGameEvent( eventName:String ) : void
		function registerGameEvent( eventName:String ) : void
		function onGameEvent(e:Event):void 
	}
	
}