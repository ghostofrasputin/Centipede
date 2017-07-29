//----------------------------------------------------------
// Bullet class
//---------------------------------------------------------- 

class Bullet{
  private int x,y,w,h,speed;
  int[] collisionInfo;
  
  Bullet(int x, int y){
    this.x=x;
    this.y=y;
    this.w = 5;
    this.h = 10;
    this.speed = 12;
    collisionInfo = new int[]{x,y,w,h};
  }
  
  void display(){
    fill(purple);
    rect(x,y,w,h);
  }
  
  void update(){
    y-=speed;
    collisionInfo = new int[]{x,y,w,h};
  }
}