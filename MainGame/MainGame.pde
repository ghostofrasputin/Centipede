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
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Mushroom> mushrooms = new ArrayList<Mushroom>();

int bulletPause = 0;
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
  
  // fires bullets and maintains bullet spacing,
  // only 1-3 bullets on screen at a time
  if(keys[2] && frameCount>bulletPause+30){
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
  
  for(int i=0; i<mushrooms.size();i++){
    Mushroom m = mushrooms.get(i);
    for(int j=0; j<bullets.size(); j++){
      Bullet b = bullets.get(j);
      if(m.bulletCollision(b)){
        bullets.remove(j);
        if(m.hit==2){
          mushrooms.remove(i);
        }
      }
    }
    m.display();
    m.update();
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