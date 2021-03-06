/***********************************************************
 * Program: Atari's Centipede (clone)                      *
 * Author: Jacob Preston                                   *
 *                                                         *
 * Instructions:                                           *
 * move back and forth with A and D                        *
 * shoot by pressing the O button                          * 
 *                                                         *
 ***********************************************************/

//----------------------------------------------------------
// Global variables
//----------------------------------------------------------
boolean[] keys = {false, false, false};
Player cannon = new Player(200,750);
Scorpion s;
int scorpionSpawnRate = 300;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Mushroom> shrooms = new ArrayList<Mushroom>();
ArrayList<Centipede> centipedes = new ArrayList<Centipede>();

int bulletPause = 0;
int levelNum = 0;
int progress = 1;

// Colors:
color pink = #F205C7;
color red = #FF4B4B;
color blue = #0CB6F4;
color purple = #FE08FF;
color orange = #FF8C1F;
color green = #00FF46;

//----------------------------------------------------------
// Setup Function
//---------------------------------------------------------- 
void setup(){
  size(660,800);
}

//----------------------------------------------------------
// Draw Function
//---------------------------------------------------------- 
void draw(){
  background(0);
  if(levelNum < progress){
    Centipede enemy = new Centipede(10);
    centipedes.add(enemy);
    generateshrooms();
    levelNum++;
  }
  
  for(int i=0; i<centipedes.size(); i++){
    Centipede c = centipedes.get(i);
    c.display();
    c.update();
  }
  
  // For now spawn a scorpion every 300 frames
  if(frameCount%scorpionSpawnRate == 0){
     s = new Scorpion(0,(int)random(200,700)); 
    scorpionSpawnRate += scorpionSpawnRate*2;
  }
  //s = new Scorpion(500,500); 
  if(s!=null){
    if(s.alive){
      s.display();
      s.update();
    }
  }
  
  // fires bullets and maintains bullet spacing,
  // only 1-3 bullets on screen at a time
  if(keys[2] && frameCount>bulletPause+15){
    Bullet b = new Bullet(cannon.x,cannon.y);
    bullets.add(b);
    //print(bullets.get(0).collisionInfo[1]);
    bulletPause = frameCount;
  }
  
  for(int i=0; i<bullets.size();i++){
    Bullet b = bullets.get(i);
    // clean up bullets that go off screen
    if(b.y<0){
      bullets.remove(i);
    } else {
      b.display();
      b.update();
    }
  }
  
  ArrayList<Mushroom> destroyList = new ArrayList<Mushroom>(); 
  for(int i=0; i<shrooms.size();i++){
    Mushroom m = shrooms.get(i);
    for(int j=0; j<bullets.size(); j++){
      Bullet b = bullets.get(j);
      if(m.bulletCollision(b)){
        bullets.remove(j);
        if(m.hit==2){
          destroyList.add(m);
        }
      }
    }
    m.display();
    m.update();
  }
  
  for(int i=0; i<destroyList.size(); i++){
    shrooms.remove(destroyList.get(i));
  }
  
  cannon.display();
  cannon.update();
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

// creates a random field of shrooms on
// a grid
void generateshrooms(){
  int cols = 33; 
  int rows = 40;
  int spacing = 20;
  int xDiff = 10;
  int yDiff = 10;
  //creates a random grid of shrooms
  for(int i=0; i<cols;i++){
    for(int j =0; j<rows; j++){
      boolean skipRows = (j>32 || j<2) ? true : false;
      if(random(1)>.9 && !skipRows){
        Mushroom temp = new Mushroom(xDiff,yDiff);
        shrooms.add(temp);
      } 
      yDiff += spacing;
    }
    xDiff += spacing;
    yDiff = 10;
  }
}

// rectangle collision check
// true if there's a collision, else false
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