package events
{
	public class DBEvent extends BaseEvent
	{
		public static const CONECTAR:String = 'conectarBase';
		
		public function DBEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			clase = "DBEvent";
		}
	}
}