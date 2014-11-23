	package room 
	{
		import actor.Hexa;
		import net.flashpunk.Entity;
		import net.flashpunk.World;
		
		public class GameStage extends World 
		{
			
			public function GameStage() 
			{
				super();
				//add(new Hexa());
				for (var thisX:int = 0; thisX < 7; thisX++)
				{
					for (var thisY:int = 0; thisY < 6; thisY++)
					{
						var newHex : Entity = new Hexa();
						add(newHex);
						newHex.x = (thisX * 40) + 40;
						if (thisX % 2 != 1)
						{
							newHex.y = (thisY * 40)+10;
						}
						else
						{
							newHex.y = (thisY * 40)-10;
						}
					}
				}
			}
			
		}

	}