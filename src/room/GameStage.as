	package room 
	{
		import actor.Hexa;
		import net.flashpunk.Entity;
		import net.flashpunk.World;
		import net.flashpunk.FP;
		
		public class GameStage extends World 
		{
			private var arHolder : Array = new Array();
			public function GameStage() 
			{
				super();
				//add(new Hexa());
				for (var kolom:int = 0; kolom < 7; kolom++)
				{
					for (var baris:int = 0; baris < 7; kolom++)
					{
						//arHolder[kolom, baris] = FP.rand(6);
					}
				}
				
				
				
				for (var thisX:int = 0; thisX < 7; thisX++)
				{
					for (var thisY:int = 0; thisY < 6; thisY++)
					{
						var ranInt :int = FP.rand(6);
						var newHex : Hexa = new Hexa(ranInt);
						add(newHex);
						newHex.x = ((thisX + 3) * 40) + 40;
						if (thisX % 2 != 1)
						{
							newHex.y = ((thisY+3) * 40)+10;
						}
						else
						{
							newHex.y = ((thisY+3) * 40)-10;
						}
					}
				}
			}
			
		}

	}