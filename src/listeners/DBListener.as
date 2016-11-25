package listeners
{
	import events.DBEvent;
	
	import flash.events.Event;
	
	import model.ModelApp;
	
	import mx.rpc.events.ResultEvent;
	
	public class DBListener implements IBaseListener
	{
		private static var evento:DBEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		public static function exec(event:Event):void
		{
			evento = DBEvent(event);
			switch(evento.type){
				case DBEvent.CONECTAR:
					//rmtObjClientes.getAllClientes();
					
					break;
			}
			
		}
		
		public static function result(event:ResultEvent):void
		{
		}
	}
}