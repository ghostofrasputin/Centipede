//----------------------------------------------------------
// Segment
//---------------------------------------------------------- 

class Segment {
  private int x,y,w,h,speed;
  //private float[] goalPos;
  
  Segment(int x,int y){
    this.x=x;
    this.y=y;
    this.w = 15;
    this.h = 15;
    this.speed = 3;
    //this.goalPos = new float[]{325,30};
  }
  
  void display(){
    fill(atomic_orange);
    //rectMode(CENTER);
    rect(x,y,w,h);
    //rectMode(CORNER);
  }
  
  void update(){
    boolean flag = false;
    for(int i=0; i<shrooms.size(); i++){
      Mushroom m = shrooms.get(i);
      if(rectCollision(m.currentCollisionInfo,new int[]{x,y+10,w,h})){
        flag = true;
      }
    }
    if(flag){
      x+=speed;  
    } else {
      y+=speed;
    }
  }
  
}