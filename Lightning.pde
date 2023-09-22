int startX = 500;
int startY = 0;
int endX = 500;
int endY = 10;

double split;
int splitStartX = 0;
int splitStartY = 0;
int splitEndX = 0;
int splitEndY = 0;

float thick = 4;
float splitThick;
int fade = 50;

public void setup()
{
  size (1000, 1000);
  background (0);
  frameRate(60);
}

public void draw()
{
  fill(#E3F3F5,fade);
  rect(0,0,1000,1000);
  stroke(#E3F3F5);

  while (endY < 1000)
  {
    strokeWeight(thick);
    
    endX = startX + ((int)(Math.random()*50)-30);
    endY = startY+ 15 + (int)(Math.random()*10);
    line(startX, startY, endX, endY);
    startX = endX;
    startY = endY;

    split = Math.random();
    
    if (split > 0.97 && endY > 200)
    {
      splitStartX = endX;
      splitStartY = endY;
      splitThick = thick;
      while (splitEndY < 1000)
      {
        strokeWeight(splitThick);
        splitEndX = splitStartX + ((int)(Math.random()*60)-20);
        splitEndY = splitStartY+ 15 + (int)(Math.random()*10);
        line(splitStartX, splitStartY, splitEndX, splitEndY);
        splitStartX = splitEndX;
        splitStartY = splitEndY;
        splitThick -= 0.074;
      }
    }
    
    thick = thick - 0.072; 
  }
  
fade -= 60;
  fill(0, 15);
  rect(0, 0, 1000, 1000);
  textSize(100);
  text("Secret Message",150,500);
  
}

void mousePressed()
{
  //redraw();
  startY = 0;
  startX = mouseX;
  endY = 10;
  endX = 500;
  
  splitStartX = 500;
  splitStartY = 500;
  splitEndX = 500;
  splitEndY=0;
  
  thick = 4;
  fade = 100;
}
