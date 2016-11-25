package model
{
	import flash.data.SQLConnection;
	import flash.filesystem.File;
	
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
									'122212' : 2,
									'212221' : 3,
									'111212' : 4,
									'212111' : 5,
									'212222' : 6,
									'222212' : 7,
									'111211' : 8,
									'112111' : 9,
									'111222' : 10,
									'222111' : 11,
									'121111' : 12,
									'111121' : 13,
									'221222' : 14,
									'222122' : 15,
									'122112' : 17,
									'112222' : 18,
									'222211' : 19,
									'122121' : 20,
									'122121' : 21,
									'222221' : 22,
									'122222' : 23,
									'122111' : 24,
									'111221' : 25,
									'122221' : 26,
									'211112' : 27,
									'212212' : 28,
									'121121' : 29,
									'221112' : 30,
									'211122' : 31,
									'221111' : 32,
									'111122' : 33,
									'222121' : 34,
									'121222' : 35,
									'121211' : 36,
									'112121' : 37,
									'221212' : 38,
									'212122' : 39,
									'112221' : 40,
									'122211' : 41,
									'111112' : 42,
									'211111' : 43,
									'222112' : 44,
									'211222' : 45,
									'212112' : 46,
									'211212' : 47,
									'121112' : 48,
									'211121' : 49,
									'122122' : 50,
									'221221' : 51,
									'221211' : 52,
									'112122' : 53,
									'121122' : 54,
									'221121' : 55,
									'211211' : 56,
									'112112' : 57,
									'212211' : 58,
									'112212' : 59,
									'112211' : 60,
									'221122' : 61,
									'121212' : 62,
									'212121' : 63
								};
		
		
		
		public var resultadoTiradaVO:ResultadoTiradaVO;
		public var dbFile:File;
		public var sqlConnection:SQLConnection;
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