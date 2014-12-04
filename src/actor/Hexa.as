package actor 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	public class Hexa extends Entity 
	{
		private var img : Image = new Image(new BitmapData(32, 32, false, 0xFFFFFF));
		//public var NumImg:int = 0;
		public function Hexa(numimg:int) 
		{
			graphic = img;
			//NumImg = numimg;
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
			setHitbox(32, 32);
		}
		
	}

}