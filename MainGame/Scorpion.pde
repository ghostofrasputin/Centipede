//----------------------------------------------------------
// Scorpion class
//---------------------------------------------------------- 

class Scorpion {
  int x,y,w,h,speed;
  int ft1 = 0;
  int ft2 = 0;
  final int transitionThreshold = 15;
  // scorpion can only move along the x-axis
  // true -> west
  // false -> east
  boolean dir;
  boolean alive;
  
  Scorpion(int x, int y){
    this.x = x;
    this.y = y;
    this.w = 70;
    this.h = 40;
    this.speed = 4;
    this.dir = false;
    //this.dir = (random(1)>0.5) ? true : false;
    this.alive = true;
  }
  
  void display(){
    if(ft1<transitionThreshold){
      sprite1();
      ft1++;
    } else {
      sprite2();
      ft2++;
      if(ft2>transitionThreshold){
        ft1 = 0;
        ft2 = 0;
      }
    }
  }
  
  // open claw
  void sprite1(){
    //scale(.5);
    fill(green);
    // main body:
    rect(x+20,y,15,35);
    // left claw:
    rect(x,y,5,5);
    rect(x+10,y,5,5);
    rect(x+5,y+5,5,10);
    rect(x+5,y+10,10,5);
    rect(x+10,y+15,10,5);
    // left eye:
    fill(pink);
    rect(x+15,y+5,10,5);
    rect(x+20,y,5,5);
    fill(green);
    // right claw:
    rect(x+50,y,5,5);
    rect(x+40,y,5,5);
    rect(x+45,y+5,5,10);
    rect(x+40,y+10,10,5);
    rect(x+35,y+15,10,5);
     // right eye:
    fill(pink);
    rect(x+30,y+5,10,5);
    rect(x+30,y,5,5);
    fill(green);
    //right tail:
    rect(x+25,y+35,25,5);
    rect(x+35,y+30,20,5);
    rect(x+45,y+25,15,5);
    rect(x+55,y+20,5,5);
    rect(x+60,y+15,10,5);
    rect(x+65,y+20,5,15);
    rect(x+60,y+30,5,10);
    //scale(2);
  }
  
  // closed claw
  void sprite2(){
    //scale(0.5);
    fill(green);
    // main body:
    rect(x+20,y,15,35);
    // left claw:
    rect(x+5,y,5,5);
    
    rect(x+5,y+5,5,10);
    rect(x+5,y+10,10,5);
    rect(x+10,y+15,10,5);
    // left eye:
    fill(pink);
    rect(x+15,y+5,10,5);
    rect(x+20,y,5,5);
    fill(green);
    // right claw:
    rect(x+45,y,5,5);
    rect(x+45,y+5,5,10);
    rect(x+40,y+10,10,5);
    rect(x+35,y+15,10,5);
     // right eye:
    fill(pink);
    rect(x+30,y+5,10,5);
    rect(x+30,y,5,5);
    fill(green);
    //right tail:
    rect(x+25,y+35,25,5);
    rect(x+35,y+30,20,5);
    rect(x+45,y+25,15,5);
    rect(x+55,y+20,5,5);
    rect(x+60,y+15,10,5);
    rect(x+65,y+20,5,15);
    rect(x+60,y+30,5,10);
    //scale(2);
  }
  
  void update(){
    for(int i=0; i<shrooms.size();i++){
      Mushroom m = shrooms.get(i);
      if(rectCollision(m.currentCollisionInfo,new int[]{x,y,w,h})){
        m.setPoisonFlag();
      }
    }
    
    for(int i=0; i<bullets.size();i++){
      Bullet b = bullets.get(i);
      if(rectCollision(b.collisionInfo,new int[]{x,y,w,h})){
        println("hey");
        alive = false;
      }
    }
    
    
    // west
    if(dir==true){
      x-=speed;
    } 
    // east
    else {
      x+=speed;
    }
  }
  
}