//----------------------------------------------------------
// Segment
//---------------------------------------------------------- 

class Segment {
  private int x,y,w,h,speed;
  //private float[] goalPos;
  private boolean isHead;
  private char dir = 's';
  private char lastDir = 'w';
  private int tracker = 0;
  ArrayList<int[]> nodePoints = new ArrayList<int[]>();
  
  Segment(int x,int y, boolean isHead){
    this.x=x;
    this.y=y;
    this.w = 15;
    this.h = 15;
    this.speed = 3;
    this.isHead = isHead;
    //this.goalPos = new float[]{325,30};
  }
  
  void display(){
    fill(atomic_orange);
    //rectMode(CENTER);
    rect(x,y,w,h);
    //rectMode(CORNER);
  }
  
  void update(){
    if(isHead){
      switch(dir){
        case 's':
          y+=speed;
          tracker++;
          collisionCheck();
          if(tracker == 10){
            if(lastDir == 'w'){
              dir = 'e';
            }
            if(lastDir == 'e'){
              dir = 'w';
            }
            tracker = 0;
          }
          break;
        case 'w':
          x-=speed;
          lastDir = 'w';
          collisionCheck();
          break;
        case 'e':
          x+=speed;
          lastDir = 'e';
          collisionCheck();
          break;
        default:
          break;
      }  
    } else {
    }
  }
  
  void collisionCheck(){
    // bounds collision:
    if(x<=0){
      dir = 's';
    }
    if(x>=width-15){
      dir = 's';
    }
    // mushroom collision:
    for(int i=0; i<shrooms.size(); i++){
      Mushroom m = shrooms.get(i);
      if(dir == 's'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x,y+5,w,h})){
          tracker = 10;
          break;
        }
      }
      if(dir == 'e'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x+5,y,w,h})){
          dir = 's';
          break;
        }
      }
      if(dir == 'w'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x-5,y,w,h})){
          dir = 's';
          break;
        }
      } 
    }
  }
  
}