package actor 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	public class Hexa extends Entity 
	{
		private var img : Image = new Image(new BitmapData(32, 32, false, 0xFF0000));
		public function Hexa() 
		{
			graphic = img;
		}
		
	}

}