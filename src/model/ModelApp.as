package model
{
	import vo.ResultadoTiradaVO;

	[Bindable]
	public class ModelApp
	{
		public var objValores:Object = {'8' : '2', '9' : '2', '4' : '3', '5' : '3'};
		public var objLineas:Object = {'6' : 'yin-viejo', '7' : 'yang', '8' : 'yin', '9' : 'yang-viejo'};
		
		public var resultadoTiradaVO:ResultadoTiradaVO;
		
		private static var modelLocator:ModelApp;
		
		
		
		public static function getInstance():ModelApp
		{
			if ( modelLocator == null ){
				modelLocator = new ModelApp();
			}
			
			return modelLocator;
		}
		
		public function ModelApp()
		{
			if(modelLocator){
				throw new Error("Singleton... use getInstance()");
			} 
			modelLocator = this;
		}
	}
}