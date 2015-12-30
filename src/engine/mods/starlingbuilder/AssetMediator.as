package engine.mods.starlingbuilder 
{
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starlingbuilder.engine.IAssetMediator;
	/**
	 * ...
	 * @author Dominik Forstmaier
	 */
	public class AssetMediator implements IAssetMediator
	{
		private var mStarlingAssetManager:AssetManager;
		
		public function AssetMediator( manager:AssetManager ) 
		{
			mStarlingAssetManager = manager;
		}
		
		
		public function getTexture(name:String):Texture 
		{
			return mStarlingAssetManager.getTexture( name );			
		}
		
		public function getTextures(prefix:String = "", result:Vector.<Texture> = null):Vector.<Texture> 
		{
			return mStarlingAssetManager.getTextures( prefix, result );
		}
		
		public function getExternalData(name:String):Object 
		{
			// TODO: implement
			return null;			
		}
		
	}

}