package controller
{
	
	
	import events.DBEvent;
	
	import flash.events.DataEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import listeners.DBListener;
	
	import model.ModelApp;
	
	
	public class Controller extends ControllerBase
	{
		public static var controladorGeneral:Controller;
		[Bindable] private var modelApp:ModelApp = ModelApp.getInstance();
		
		
		/*private var sucursalListener:SucursalListener = new SucursalListener();
		private var clienteListener:ClienteListener = new ClienteListener();
		private var mantenedorListener:MantenedorListener = new MantenedorListener();*/
		
		public static function getInstance():Controller
		{
			if ( controladorGeneral == null ){
				controladorGeneral = new Controller();
				
			}
			
			return controladorGeneral;
		}
		
		public function Controller(target:IEventDispatcher=null)
		{
			if(controladorGeneral){
				throw new Error("Singleton... use getInstance()");
			} 
			controladorGeneral = this;
			inic();			
		}
		
		public function inic():void{
			addEventListenerNew(DBEvent.CONECTAR, DBListener);
		}	
		
	}
}