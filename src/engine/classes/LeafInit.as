package engine.classes 
{
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class LeafInit extends RootObject 
	{
		private var mOnInitFinished:Function;
		
		public function LeafInit() 
		{
			super();			
		}
		
		public function init( onInitFinished:Function = null ) : void
		{
			mOnInitFinished = onInitFinished;			
		}
		
		protected function finishInit() : void
		{
			if ( mOnInitFinished != null )
			{
				mOnInitFinished();
			}
			
		}
		
		
	}

}