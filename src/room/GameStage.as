	package room 
	{
		import actor.Hexa;
		import net.flashpunk.World;
		
		public class GameStage extends World 
		{
			
			public function GameStage() 
			{
				super();
				add(new Hexa());
			}
			
		}

	}