/***********************************************************
 * Program: Atari's Centipede remake project               *
 * Author: Jacob Preston                                   *
 *                                                         *
 * Instructions:                                           *
 * move back and forth with A and D                        *
 * shoot by pressing the O button                          * 
 *                                                         *
 ***********************************************************/

import java.util.Arrays;

//----------------------------------------------------------
// Global variables
//----------------------------------------------------------
boolean[] keys = {false, false, false};
Player humanoid = new Player(200,750);
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Mushroom> mushrooms = new ArrayList<Mushroom>();

int fc = 0;
int levelNum = 0;
int progress = 1;

// Colors:
//color red = 
color atomic_blue = #0cb6f4;
color atomic_purple = #FE08FF;


//----------------------------------------------------------
// Setup Function
//---------------------------------------------------------- 
void setup(){
  size(650,800);
}

//----------------------------------------------------------
// Draw Function
//---------------------------------------------------------- 
void draw(){
  background(0);
  
  if(levelNum < progress){
    generateMushrooms();
    levelNum++;
  }
  
  
  
  if(keys[2] && frameCount>fc+30){
    Bullet b = new Bullet(humanoid.x,humanoid.y);
    //b.display();
    //b.update();
    bullets.add(b);
    fc = frameCount;
  }
  
  for(int i=0; i<bullets.size();i++){
    Bullet temp = bullets.get(i);
    temp.display();
    temp.update();
  }
  
  for(int i=0; i<mushrooms.size();i++){
    Mushroom temp = mushrooms.get(i);
    temp.display();
    temp.update();
  }
  
  humanoid.display();
  humanoid.update();
}

//----------------------------------------------------------
// Handle Key Input: keeps track of multiple key presses
//---------------------------------------------------------- 
void keyPressed(){
  if(key=='a' || key == 'A')
    keys[0]=true;
  if(key=='d' || key == 'D')
    keys[1]=true;
  if(key=='o' || key == 'O')
    keys[2]=true;
}

void keyReleased(){
  if(key=='a' || key == 'A')
    keys[0]=false;
  if(key=='d' || key == 'D')
    keys[1]=false;
  if(key=='o' || key == 'O')
    keys[2]=false;  
}

//----------------------------------------------------------
// Functions
//---------------------------------------------------------- 

// creates a random field of mushrooms on
// a grid
void generateMushrooms(){
  int row = 39;
  int col = 35;
  int xDiff = 10;
  int yDiff = 20;
  // creates a random grid of mushrooms
  for(int i=0; i<row;i++){
    for(int j =0; j<col; j++){
      if(random(1)>.8){
        Mushroom temp = new Mushroom(i+xDiff,j+yDiff);
        mushrooms.add(temp);
      }
      yDiff+=20;
    }
    xDiff+=20;
    yDiff = 20;
  }
}

// True if there's a collision, else False
boolean rectCollision(int[]rect1 ,int[] rect2){
  // rect 1
  int minX = rect1[0];
  int maxX = rect1[0] + rect1[2];
  int minY = rect1[1];
  int maxY = rect1[1] + rect1[3];
  // rect 2
  int minX2 = rect2[0];
  int maxX2 = rect2[0] + rect2[2];
  int minY2 = rect2[1];
  int maxY2 = rect2[1] + rect2[3];
  // collision detection for player and wall
  return (minX < maxX2 && maxX > minX2 && minY < maxY2 && maxY > minY2);
}

// end --