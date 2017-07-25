/***********************************************************
 * Program: Atari's Centipede remake project               *
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
Player humanoid = new Player(200,750);
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

// Colors:
//color red = 
color atomic_blue = #0cb6f4;


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
  if(frameCount%10 == 0 && keys[2] ){
    Bullet b = new Bullet(humanoid.x,humanoid.y);
    //b.display();
    //b.update();
    bullets.add(b);
  }
  
  for(int i=0; i<bullets.size();i++){
    Bullet temp = bullets.get(i);
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

void generateMushrooms(){

}