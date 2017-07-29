//----------------------------------------------------------
// Scorpion class
//---------------------------------------------------------- 

class Scorpion {
  int x,y,w,h,speed;
  int ft1 = 0;
  int ft2 = 0;
  final int transitionThreshold = 200;
  // scorpion can only move along the x-axis
  // true -> west
  // false -> east
  boolean dir;
  
  
  Scorpion(int x, int y){
    this.x = x;
    this.y = y;
    this.w = this.h = 20;
    this.speed = 3;
    this.dir = false;
    //this.dir = (random(1)>0.5) ? true : false;
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
  
  void sprite1(){
    fill(red);
    rect(x,y,w,h);
  }
  
  void sprite2(){
    fill(red);
    rect(x,y,w,h);
  }
  
  void update(){
    for(int i=0; i<shrooms.size();i++){
      Mushroom m = shrooms.get(i);
      if(rectCollision(m.currentCollisionInfo,new int[]{x,y,20,20})){
        m.setPoisonFlag();
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