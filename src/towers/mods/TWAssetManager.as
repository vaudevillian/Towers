package towers.mods 
{
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class TWAssetManager extends AssetManager 
	{
		private static const BG_PATH:String = "assets/backgrounds/";
		private static const TEXTURE_PATH:String = "assets/textures/";
		private static const SCREEN_PATH:String = "assets/screens/";
		private static const FONT_PATH:String = "assets/fonts/";
		
		public function TWAssetManager(scaleFactor:Number=1, useMipmaps:Boolean=false) 
		{
			super(scaleFactor, useMipmaps);			
		}
		
		public function enqueueScreen( screenName:String ) : void
		{
			enqueue( SCREEN_PATH + screenName );
		}
		
		public function enqueueFont( fontName:String ) : void
		{
			enqueue( FONT_PATH + fontName );
		}
		
		public function enqueueBackground( bgName:String ) : void
		{
			enqueue( BG_PATH + bgName );
		}
		
		public function enqueueTexture( textureName:String, isAtlas:Boolean ) : void
		{
			enqueue( TEXTURE_PATH + textureName );		
			
			if ( isAtlas ) 
			{
				textureName = textureName.substr( 0, textureName.indexOf( ".png" ) );
				//textureName = textureName.substr( 0, textureName.indexOf( ".jpg" ) );
				//textureName = textureName.substr( 0, textureName.indexOf( ".atf" ) );
				enqueue( TEXTURE_PATH + textureName + ".xml" );				
			}
		}
		
		public function getScreen( fileName:String ) : Object
		{
			fileName = fileName.substr( 0, fileName.indexOf( ".json" ) );
			return getObject( fileName );			
		}
		
		
	}

}