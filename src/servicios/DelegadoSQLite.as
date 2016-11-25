package servicios
{
	
	
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.net.Responder;
	
	import model.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.formatters.DateFormatter;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;

	public class DelegadoSQLite extends EventDispatcher
	{
		protected var dbFile:File;
		
		//protected var sqlConnection:SQLConnection;
		
		protected var dbAsyncToken:AsyncToken;
		
		private var cache:ArrayCollection;
		
		public static const MOCK_ASYNC_TIME:int = 100;
		
		private var lastId:int;
		
		private static var delegado:DelegadoSQLite;
		
		private var modelo:ModelApp = ModelApp.getInstance();
		
		public static function getInstance():DelegadoSQLite
		{
			if ( delegado== null ){
				delegado = new DelegadoSQLite();
				
			}			
			return delegado;
		}
		
		public function DelegadoSQLite()
		{
			if(delegado){
				throw new Error("Singleton... use getInstance()");
				
			} 
			initDB();
			delegado = this;
		}
		
		private function initDB():void
		{
			
			/*****CREA EL DIRECTORIO QUE NECESITO PARA LA BASE****/
			//var appUserDir:File = new File(File.applicationStorageDirectory.nativePath + "/CRUDTablet/");
			var appUserDir:File = new File(File.applicationStorageDirectory.nativePath + "/IChing/");
			if (!appUserDir.exists)
			{
				appUserDir.addEventListener(Event.COMPLETE, onDataDirectoryCreated);
				appUserDir.createDirectory();
				
				
			}
			dbFile = new File(File.applicationStorageDirectory.nativePath + "/IChing/IChing.db");
			modelo.dbFile = dbFile;
			if(dbFile.exists){
				openDBAsync();
			}else{
				onDataDirectoryCreated(null);
			}

		}
		
		
		private function creacionDB():void
		{
			if (modelo.sqlConnection)
			{
				modelo.sqlConnection.close();
			}
			modelo.sqlConnection = new SQLConnection();
			modelo.sqlConnection.open(dbFile, "create");			
			
			/*************Generacion de la base de datos sqlite**************/
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = modelo.sqlConnection;
			stmt.text = "CREATE TABLE IF NOT EXISTS tbl_Hexagramas (numero INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, dictamen TEXT, imagen TEXT, comentario TEXT, linea1 TEXT, linea2 TEXT, linea3 TEXT, linea4 TEXT, linea5 TEXT, linea6 TEXT)";
			stmt.execute();
			
			stmt.text = "SELECT 0 cant";
			
			stmt.execute();
			trace(stmt.getResult());
			var arr:ArrayCollection = new ArrayCollection(stmt.getResult().data);
		}	
		
		
		protected function onDataDirectoryCreated(event:Event):void
		{
			var testPath:String = File.applicationDirectory.url;
			var assetsDir:File = new File(testPath);
			
			//var origDBFile:File = new File("d:\\plazo.db");
		/*	var origDBFile:File = new File(File.applicationDirectory.url + "assets/data/plazos.db");
			//dbFile = new File(File.applicationStorageDirectory.nativePath + "/Plazos/plazos.db");
			
			
			origDBFile.copyTo(dbFile, true);*/
			//openDBAsync();
			creacionDB();//  primera apertura crea tablas y data 
			
		}
		
		protected function openDBAsync():void
		{
			modelo.sqlConnection = new SQLConnection();
			modelo.sqlConnection.openAsync(dbFile, SQLMode.UPDATE, null);
			
		}
		
		private function onDBError(event:*):void
		{
			trace("db error just happened");
			
		}	
		
		/*public function consultaEventos(getEventosResultHandler:Function, event:TransaccionEventoEvent = null):void{
			var getExpensesSQLStatement:SQLStatement = new SQLStatement();
			getExpensesSQLStatement.sqlConnection = modelo.sqlConnection;
			getExpensesSQLStatement.text = "SELECT id, nombre, fecha , descripcion, evento, estado, telefono, e_mail, estado FROM tbl_registro_evento";
			if(event != null){
				getExpensesSQLStatement.text += " WHERE id = " + event.evento.id;
			}
			getExpensesSQLStatement.execute(-1, new flash.net.Responder(getEventosResultHandler, onDBError));
		}*/
		
		
		
	}
}