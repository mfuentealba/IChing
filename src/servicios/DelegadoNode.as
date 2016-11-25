package servicios
{
	
	
	
	import componentes.clases.ConexionSocket;
	
	import eventos.MovimientoEvent;
	import eventos.PartidaEvent;
	import eventos.SesionEvent;
	
	import flash.events.EventDispatcher;
	import flash.net.Responder;
	
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;

	public class DelegadoNode extends EventDispatcher
	{
		
		
		protected var dbAsyncToken:AsyncToken;
		
		private var cache:ArrayCollection;
		
		public static const MOCK_ASYNC_TIME:int = 100;
		
		private var lastId:int;
		
		private static var delegado:DelegadoNode;
		private var connNode:ConexionSocket = new ConexionSocket();
		private var _callbackRecep:Function;
		
		public static function getInstance():DelegadoNode
		{
			if ( delegado== null ){
				delegado = new DelegadoNode();
				
			}			
			return delegado;
		}
		
		public function DelegadoNode()
		{
			if(delegado){
				throw new Error("Singleton... use getInstance()");
				
			} 
			
			delegado = this;
			init();
		}
		
		private function init():void
		{
			
			/*****CREA EL DIRECTORIO QUE NECESITO PARA LA BASE****/
			connNode.callbackRecep = this.callbackRecep;

		}
		
		public function consultaSesion(data:SesionEvent, callback:Function):void{
			connNode.envia('LR|' + data.user + '|' + data.pass + '|', callback);
		}
		
		public function creaPartida(data:PartidaEvent, callback:Function):void{
			connNode.envia('CP|' + data.idJugador + '|' + data.opcion + '|' + data.tiempo + '|', callback);
		}
		
		public function buscaPartida(data:PartidaEvent, callback:Function):void{
			connNode.envia('BP|' + data.idJugador + '|' + data.opcion + '|' + data.tiempo + '|', callback);
		}
		
		public function ejecutaMovimiento(data:MovimientoEvent, callback:Function):void{
			connNode.envia('EM|' + data.movimiento + '|' + data.idPartida + '|' + data.tiempo + '|' + data.idOponente + '|' + data.color + '|' + data.nroJugada + '|', callback);
		}

		public function get callbackRecep():Function
		{
			return _callbackRecep;
		}

		public function set callbackRecep(value:Function):void
		{
			_callbackRecep = value;
			this.connNode.callbackRecep = value;
		}
		
		
	}
}