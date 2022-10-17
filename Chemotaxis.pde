int number = 10;
organism[] array = new organism [number +=10];

int speed = 1;
boolean condition = true;
boolean hardMode = false;
void setup()
{
  size(300, 300);
  for(int i = 0; i< number; i++)
   {
     int randX = (int)(Math.random()*200 + 10);
     int randY = (int)(Math.random()*200 + 10);
     
     array[i] = new organism(randX, randY);
   }
}

void draw()
{  
  fill(#F5316C);
  background(100);

//hardMode conditions
  if(hardMode == true)
  {
    speed = 3;
    textSize(15);
    text("Hard Mode Enabled >:(", 100, 30);

  }

 for(int i = 0; i < number; i++)
 {
   int randC1 = (int)(Math.random()*255 + 50);
   int randC2 = (int)(Math.random()*255 + 50);
   int randC3 = (int)(Math.random()*255 + 50);
   
   array[i].show(randC1, randC2, randC3);
  
  if(condition == true)
  {
   array[i].move();
  }
  else
  {
    fill(#FFFFFF);
    textSize(50);
    text("Game Over", 10, 100);
  }
 }
}
void mouseClicked()
{
  textSize(15);
  fill(#FFFFFF);
  hardMode = true;
  number = 20;
}

class organism
{
  int xCoord, yCoord, Color;
  int counter = 0;
  organism(int x, int y)
  {
    xCoord = x;
    yCoord = y;
  }
  
 void move()
 {
   for(int i = 0; i < speed; i++)
   {
   if(Math.random() > 0.5)
     {
       xCoord += 2;
     } 
     else {xCoord -= 2;}
   if(Math.random() > 0.5)
     {
       yCoord += 2;
     } 
     else {yCoord -= 2;}
   
   if(mouseX + 10 >= xCoord)
   {    
      xCoord++;
   }
   if(mouseY + 10 >= yCoord)
   {    
      yCoord++;
   }
    if(mouseX - 10 <= xCoord)
   {    
      xCoord--;
   }
   if(mouseY - 10 <= yCoord)
   {    
      yCoord--;
   }
   if((mouseX -2 < xCoord && xCoord < mouseX +2) && (mouseY -2 < yCoord && yCoord < mouseY + 2))
   {
     condition = false;
   }
 }
} 
 
 void show(int randC1, int randC2, int randC3)
 {
   fill(#3477E8);
   if(condition == true)
   {
     fill(randC1, randC2, randC3);
   }
   ellipse(xCoord, yCoord, 10, 10);
   ellipse(xCoord -2, yCoord - 2, 2, 2);
   ellipse(xCoord +2, yCoord - 2, 2, 2);
   rect(xCoord -3, yCoord + 2, 5, 1);
 }
}
