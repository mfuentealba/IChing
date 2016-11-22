package assets.skins
{
	import spark.skins.mobile.TextInputSkin;
	
	public class CustomTextInput extends TextInputSkin
	{
		public function CustomTextInput()
		{
			super();
			layoutCornerEllipseSize = 30;
		}
		
		override protected function createChildren():void
		{
			// TODO Auto Generated method stub
			super.createChildren();
			border.visible = false;
		}
		
	}
}