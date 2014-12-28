package actor 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;
	
	public class Hexa extends Entity 
	{
		private var img : Image = new Image(new BitmapData(32, 32, false, 0xFFFFFF));
		public var pForPoint : Point = new Point(0, 0);
		public var hasPointUp : Boolean = false;
		//public var numim:int = 0;
		public function Hexa(numimg:int) 
		{
			graphic = img;
			
			switch(numimg)
			{
				case 0:
					img.color = 0xFF0000;
					break;
				case 1:
					img.color = 0x00FF00;
					break;
				case 2:
					img.color = 0x0000FF;
					break;
				case 3:
					img.color = 0xFF00FF;
					break;
				default:
					img.color = 0xFFCC00;
					break;
			}
			type = "block";
			setHitbox(32, 32);
		}
		
		override public function update():void 
		{
			super.update();
			/*
			if (Input.mousePressed && collidePoint(x, y,world.mouseX, world.mouseY))
			{
				FP.log(pForPoint.x +" " + pForPoint.y);
				if (Global.holderInteger == -1)//  || Global.holderInteger == Global.arrayGame[pForPoint.x][pForPoint.y])
				{
					Global.holderInteger = Global.arrayGame[pForPoint.x][pForPoint.y] ;
					
					Global.firstClick = true;
					//FP.log(pForPoint.x +" " + pForPoint.y+" nilai arraynya adalah "+ Global.holderInteger );
				}
				//FP.log(pForPoint.x +" " + pForPoint.y );
				//FP.log(Global.arrayGame[pForPoint.x][pForPoint.y]);
				//Global.holderInteger = Global.arrayGame[pForPoint.x] 
				//trace("a");
			}
			if (collidePoint(x, y, world.mouseX, world.mouseY)&&Global.firstClick == true)
			{
				if (pForPoint.x % 2 == 0)
				{
					
				}
			}
			*/
		}
		
	}

}