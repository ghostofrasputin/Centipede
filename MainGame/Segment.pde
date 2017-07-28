//----------------------------------------------------------
// Segment
//---------------------------------------------------------- 

class Segment {
  private int x,y,w,h,speed;
  //private float[] goalPos;
  private char dir = 's';
  private char lastDir = 'w';
  private int tracker = 0;
  private int legSize = 5;
  private int ft1 = 0;
  private int ft2 = 0;
  
  Segment(int x,int y){
    this.x=x;
    this.y=y;
    this.h = this.w = 15;
    this.speed = 3;
  }
  
  void display(){
    //stroke(atomic_orange);
    //strokeWeight(5);
    fill(atomic_green);
    rect(x,y,w,h);
    int threshold = 10;
    // Animate leg movement:
    if(ft1<threshold){
      switch(dir){
        case 's':
          rect(x+15,y+10,legSize,legSize);
          rect(x-5,y+10,legSize,legSize);
          ft1++;
          break;
        case 'w':
          rect(x,y+15,legSize,legSize);
          rect(x,y-5,legSize,legSize);
          ft1++;
          break;
        case 'e':
          rect(x+10,y+15,legSize,legSize);
          rect(x+10,y-5,legSize,legSize);
          ft1++;
          break;
        default:
          break;
      }
    } else {
      switch(dir){
        case 's':
          rect(x+15,y+5,legSize,legSize);
          rect(x-5,y+5,legSize,legSize);
          ft2++;
          break;
        case 'w':
          rect(x+5,y+15,legSize,legSize);
          rect(x+5,y-5,legSize,legSize);
          ft2++;
          break;
        case 'e':
          rect(x+5,y+15,legSize,legSize);
          rect(x+5,y-5,legSize,legSize);
          ft2++;
          break;
        default:
          break;
      }
      if(ft2>threshold){
        ft1 = 0;
        ft2 = 0;
      }
    }
  }
  
  // update for head segment
  void update(){
    switch(dir){
      case 's':
        y+=speed;
        tracker++;
        collisionCheck();
        if(tracker >= 7){
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
  }
  
  // collision check for head:
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
          tracker = 7;
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