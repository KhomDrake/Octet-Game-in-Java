class Button
{
  float x;
  float y;
  float w;
  float h;
  String txt;
  
  Button(float _x, float _y, float _w, float _h, String text)
  {
     this.x = _x;
     this.y = _y;
     this.w = _w;
     this.h = _h;
     this.txt = text;
  }
  
  boolean isPressed()
  {
     if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h)
     {
       return true;
     }
     
     return false;
  }
  
  void Show()
  {
     noFill();
     stroke(255);
     strokeWeight(4);
     rect(x,y,w,h);
     textSize(h/3);
     textAlign(CENTER,CENTER);
     fill(0, 0, 125);
     text(txt, x + w/2, y + h/2);
  }
}
