package engine.classes 
{
	import starling.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class Screen extends DisplayObjectContainer 
	{
		protected var mTargetParent:DisplayObjectContainer;
		
		public function Screen() 
		{
			super();
		}
		
		public function show( show:Boolean, targetParent:DisplayObjectContainer ) : void
		{
			mTargetParent = targetParent;
			
			if ( show )
			{
				mount();
			}
			else
			{
				dismount();
			}
		}
		
		protected function mount() : void
		{
			if ( mTargetParent != null )
			{
				mTargetParent.addChild( this );
				this.visible = false;
			}
		}
		
		protected function onMountSuccess() : void
		{
			this.visible = true;			
		}
		
		protected function dismount() : void
		{
		}
		
		protected function onDismountSuccess() : void
		{
			if ( mTargetParent != null )
			{
				mTargetParent.removeChild( this );
			}			
		}
		
	}

}