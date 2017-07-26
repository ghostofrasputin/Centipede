

class Bullet{
  private int x,y,w,h,speed;
  ArrayList collisionInfo;
  
  Bullet(int x, int y){
    this.x=x;
    this.y=y;
    this.w = 5;
    this.h = 10;
    this.speed = 12;
    collisionInfo = new ArrayList();
  }
  
  void display(){
    fill(atomic_purple);
    rect(x,y,w,h);
  }
  
  void update(){
    y-=speed;
    collisionInfo.addAll(Arrays.asList(x,y,w,h));
  }
}