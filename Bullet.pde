

class Bullet{
  private int x,y,h,w,speed;
  
  Bullet(int x, int y){
    this.x=x;
    this.y=y;
    this.h = 10;
    this.w = 2;
    this.speed = 7;
  }
  
  void display(){
    rect(x,y,w,h);
  }
  
  void update(){
    y-=speed;
  }
}
