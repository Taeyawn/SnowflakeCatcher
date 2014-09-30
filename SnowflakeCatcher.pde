SnowFlake [] snow;
void setup()
{

  size(300,300);
  background(0);
  snow = new SnowFlake[150];
  for(int i=0; i<snow.length; i++)
  {
    snow[i] = new SnowFlake();
  }
}
void draw()
{
  for(int i=0; i<snow.length; i++)
  {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
void mouseDragged()
{
  fill(255,0,0);
  noStroke();
  ellipse(mouseX,mouseY,10,10); 
  stroke(0);
}

class SnowFlake
{
  int x, y;
  boolean isMoving;
  SnowFlake()
  {
    x = (int)(Math.random()*300);
    y = (int)(Math.random()*295);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
   if((y > 0 && y < 300) && (get(x, y+5) != color(0)))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;
    }
  }
  void erase()
  {
     fill(0);
     ellipse(x,y,7,7);
  }
  void move()
  {
    if(isMoving == true)
    {
      y++;
    }
  }
  void wrap()
  {
    if(y==295)
    {
      y = 0;
      x = (int)(Math.random()*300);
    }
  }
}

