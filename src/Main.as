package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import room.GameStage;
	
	public class Main extends Engine 
	{
		public function Main()
		{
			super(640, 480);
		}
		override public function init():void 
		{
			super.init();
			FP.world = new GameStage();
			FP.console.enable();
			//FP.log(FP.VERSION);
		}
	}
	
}