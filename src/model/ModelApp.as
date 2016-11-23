package model
{
	import vo.ResultadoTiradaVO;

	[Bindable]
	public class ModelApp
	{
		public var objValores:Object = {'8' : '2', '9' : '2', '4' : '3', '5' : '3'};
		public var objLineas:Object = {'6' : 'yin-viejo', '7' : 'yang', '8' : 'yin', '9' : 'yang-viejo'};
		public var objTransfHex:Object = {'yin-viejo' : '2', 'yang' : '1', 'yin' : '2', 'yang-viejo' : '1'};
		public var objHex:Object = {
									'111111' : 0,
									'222222' : 1,
									'222222' : 1,
									'111111' : 3,
									'111111' : 4,
									'111111' : 5,
									'111111' : 6,
									'111111' : 7,
									'111111' : 8,
									'111111' : 9,
									'111111' : 10,
									'111111' : 11,
									'111111' : 12,
									'111111' : 13,
									'111111' : 14,
									'111111' : 15,
									'111111' : 17,
									'111111' : 18,
									'111111' : 19,
									'111111' : 20,
									'111111' : 21,
									'111111' : 22,
									'111111' : 23,
									'111111' : 24,
									'111111' : 25,
									'111111' : 26,
									'111111' : 27,
									'111111' : 28,
									'111111' : 29,
									'111111' : 30,
									'111111' : 31,
									'111111' : 32,
									'111111' : 33,
									'111111' : 34,
									'111111' : 35,
									'111111' : 36,
									'111111' : 37,
									'111111' : 38,
									'111111' : 39,
									'111111' : 40,
									'111111' : 41,
									'111111' : 42,
									'111111' : 43,
									'111111' : 44,
									'111111' : 45,
									'111111' : 46,
									'111111' : 47,
									'111111' : 48,
									'111111' : 49,
									'111111' : 50,
									'111111' : 51,
									'111111' : 52,
									'111111' : 53,
									'111111' : 54,
									'111111' : 55,
									'111111' : 56,
									'111111' : 57,
									'111111' : 58,
									'111111' : 59,
									'111111' : 60,
									'111111' : 61,
									'111111' : 62,
									'111111' : 63,
									'111111' : 64
									
								
								
								};
		
		
		
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