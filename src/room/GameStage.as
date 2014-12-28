package room 
{
	import actor.Hexa;
	import flash.geom.Point;
	import flash.net.NetStreamMulticastInfo;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;

	public class GameStage extends World 
	{
		private var arHolder : Array = new Array();
		private var cekInt : int = -1;
		private var arCollect : Array = new Array();
		private var oneShote : Boolean = false;
		public function GameStage() 
		{
			//add(new Hexa());
			for (var kolom:int = 0; kolom < 7; kolom++)
			{
				arHolder[kolom] = new Array();
				//Global.arrayGame[kolom] = new Array();
				for (var baris:int = 0; baris < 7; baris++)
				{
					var newInt : int = FP.rand(5);
					arHolder[kolom][baris] = newInt;
					//Global.arrayGame[kolom][baris] = newInt;
				}
			}
			
			
			
			for (var thisX:int = 0; thisX < 7; thisX++)
			{
				for (var thisY:int = 0; thisY < 7; thisY++)
				{
					var ranInt :int = arHolder[thisX][thisY];//Global.arrayGame[thisX][thisY];//
					var newHex : Hexa = new Hexa(ranInt);
					add(newHex);
					newHex.x = ((thisX + 3) * 40) + 40;
					newHex.pForPoint.x = thisX;
					newHex.pForPoint.y = thisY;
					newHex.name = thisX+" "+thisY;
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
		
		override public function begin():void 
		{
			super.begin();
			//CekAllArray();
		}
		
		override public function update():void 
		{
			super.update();
			var e : Hexa = Hexa(this.collidePoint("block", mouseX, mouseY));
			if (e != null && Input.mousePressed)
			{
				//FP.log("hit with");
				//FP.log(e.pForPoint.x + " " + e.pForPoint.y);
				oneShote = false;
				//CekAllArray();
				if (cekInt == -1)
				{
					cekInt = arHolder[e.pForPoint.x][e.pForPoint.y];
					e.hasPointUp = true;
					arCollect.push(e.pForPoint.x + " " + e.pForPoint.y);
					//arHexa.push(e);
				}
			}
			else if (e != null && Input.mouseDown )
			{
				var s:String = arCollect[arCollect.length - 1];
				var cekX : int = int(s.substr(0, 1));
				var cekY : int = int(s.substr(2,1));
				var tempCekInt : int = arHolder[e.pForPoint.x][e.pForPoint.y];
				
				if (e.hasPointUp == false)//(cekInt == tempCekInt && e.hasPointUp == false)
				{
					if (cekArray(cekX, cekY, e.pForPoint.x, e.pForPoint.y) && (cekInt == tempCekInt))
					{
						arCollect.push(e.pForPoint.x + " " + e.pForPoint.y);
						e.hasPointUp = true;
					}
				}
			}
			else if (Input.mouseReleased && oneShote==false)
			{
				//FP.log("first lengt " +arCollect.length);
				if (arCollect.length > 2)
				{
					for (var i : int = 0 ; i < arCollect.length; i++)
					{
						//FP.log(arCollect[i]);
						var a: String = arCollect[i];
						var cekforX : int = int(a.substr(0, 1));
						var cekforY : int = int(a.substr(2, 1));
						arHolder[cekforX][cekforY] = -1;
						var hex : Hexa = getInstance(cekforX+" "+cekforY)as Hexa;
						//var hex : Hexa = arHexa[i] as Hexa;
						remove(hex);
					}
				}
				oneShote = true;
				arCollect.splice(0);
				cekInt = -1;
				GoDownArray();
				createAnotherHexa();
				//CekAllArray();
				//clean holder (put in -1)
				
				// remove hexa and replace
			}
		}
		
		private function cekArray(xIni:int, yIni:int, xTujuan:int, yTujuan:int):Boolean//(p : int, cekPoint : Point):Boolean
		{
			if (xTujuan < 0 || xTujuan > 6|| yTujuan < 0 || yTujuan > 6) return false;
			if (xIni == xTujuan && (yIni == yTujuan + 1 || yIni == yTujuan - 1)) return true;
			else if (xIni == xTujuan + 1 || xIni == xTujuan -1)
			{
				if (xIni % 2 == 0)
				{
					if(yIni == yTujuan || yIni == yTujuan - 1) return true;
				}
				else
				{
					if(yIni == yTujuan || yIni == yTujuan + 1) return true;
				}
			}
			return false;
		}
		
		private function GoDownArray():void
		{
			for (var kolom:int = 0 ; kolom < 7; kolom++)//(var baris: int = 6; baris > 0; baris--)
			{
				for (var baris: int = 6; baris > 0; baris--)
				{
					if (arHolder[kolom][baris] == -1)
					{
						for (var cekBarisAtas : int = baris - 1; cekBarisAtas > 0; cekBarisAtas--)
						{
							if (arHolder[kolom][cekBarisAtas] != -1) { break;}
						}
						//if (cekBarisAtas == -1) break;
						arHolder[kolom][baris] = arHolder[kolom][cekBarisAtas];
						arHolder[kolom][cekBarisAtas] = -1;
						
						
						var hex : Hexa = getInstance(kolom + " " + cekBarisAtas) as Hexa;
						if (hex == null) continue;
						hex.pForPoint.y = baris;
						
						if (kolom % 2 != 1)
						{
							hex.y = ((baris+3) * 40)+10;
						}
						else
						{
							hex.y = ((baris+3) * 40)-10;
						}
						hex.name = kolom +" " + baris;
						
					}
					
				}
			}
		}
		
		private function createAnotherHexa():void
		{
			for (var kolom:int = 0 ; kolom < 7; kolom++)
			{
				for (var baris: int = 6; baris > -1; baris--)
				{
					if (arHolder[kolom][baris] == -1)
					{
						var newInt : int = FP.rand(5);
						arHolder[kolom][baris] = newInt;
						var newHexa : Hexa = new Hexa(newInt);
						add(newHexa);
						newHexa.x = ((kolom + 3) * 40) + 40;
						newHexa.pForPoint.x = kolom;
						newHexa.pForPoint.y = baris;
						newHexa.name = kolom+" "+baris;
						if (kolom % 2 != 1)
						{
							newHexa.y = ((baris+3) * 40)+10;
						}
						else
						{
							newHexa.y = ((baris+3) * 40)-10;
						}
					}
				}
			}
		}
		
		
		private function CekAllArray() :void
		{
			for (var i : int = 0 ; i < 7; i++)
			{
				FP.log(arHolder[i]);
			}
		}
	}// ending class
}