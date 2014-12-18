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
		private var arHexa : Array = new Array();
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
		
		override public function update():void 
		{
			super.update();
			var e : Hexa = Hexa(this.collidePoint("block", mouseX, mouseY));
			//if(Input.mousePressed && coll
			if (e != null && Input.mousePressed)
			{
				//FP.log("hit with");
				//FP.log(e.pForPoint.x + " " + e.pForPoint.y);
				oneShote = false;
				if (cekInt == -1)
				{
					cekInt = arHolder[e.pForPoint.x][e.pForPoint.y];
					e.hasPointUp = true;
					arCollect.push(e.pForPoint.x + " " + e.pForPoint.y);
					arHexa.push(e);
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
						arHexa.push(e);
						e.hasPointUp = true;
					}
					//arCollect.push(e.pForPoint.x + " " + e.pForPoint.y);
				}
			}
			else if (Input.mouseReleased && oneShote==false)
			{
				//FP.log("first lengt " +arCollect.length);
				if (arHexa.length > 2)
				{
					for (var i : int = 0 ; i < arHexa.length; i++)
					{
						//FP.log(arCollect[i]);
						var hex : Hexa = arHexa[i] as Hexa;
						remove(hex);
					}
				}
				oneShote = true;
				arCollect.splice(0);
				arHexa.splice(0);
				cekInt = -1;
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
			for (var baris: int = 6; baris > 0; baris--)
			{
				for (var kolom:int = 0 ; kolom < 7; kolom++)
				{
					var bufferInt : int = arHolder[kolom][baris];
					if (bufferInt == -1)
					{
						var cekBarisAtas : int = baris - 1;
						//while(
					}
					
				}
			}
		}
		
	}// ending class
}