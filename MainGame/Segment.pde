//----------------------------------------------------------
// Segment class
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
  int transitionThreshold = 10;
  boolean poisonFlag, bottomReached;
  
  Segment(int x,int y){
    this.x=x;
    this.y=y;
    this.h = this.w = 15;
    this.speed = 3;
    this.poisonFlag = false;
    this.bottomReached = false;
  }
  
  void display(){
    //stroke(atomic_orange);
    //strokeWeight(5);
    fill(green);
    rect(x,y,w,h);
    
    // Animate leg movement:
    if(ft1<transitionThreshold){
      switch(dir){
        case 'n':
          rect(x+15,y,legSize,legSize);
          rect(x-5,y,legSize,legSize);
          ft1++;
          break;
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
        case 'n':
          rect(x+15,y+5,legSize,legSize);
          rect(x-5,y+5,legSize,legSize);
          ft2++;
          break;
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
      if(ft2>transitionThreshold){
        ft1 = 0;
        ft2 = 0;
      }
    }
  }
  
  // update for head segment
  void update(){
    switch(dir){
      case 'n':
        y-=speed;
        collisionCheck();
        break;
      case 's':
        y+=speed;
        tracker++;
        collisionCheck();
        // keep going south after
        // poison mushroom hit:
        if(poisonFlag){
          break;
        }
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
      return;
    }
    if(x>=width-15){
      dir = 's';
      return;
    }
    
    if(y>=height-15){
      dir = 'n';
      poisonFlag = false;
      bottomReached = true;
      return;
    }
    
    // segments stay in player 
    // movement zone area
    if(bottomReached && y<=650){
      dir = 's';
      tracker = 0;
      return;
    }
    
    // mushroom collision:
    for(int i=0; i<shrooms.size(); i++){
      Mushroom m = shrooms.get(i);
      if(dir == 's'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x,y+5,w,h})){
          if(m.poisonFlag){
            poisonFlag = true;
            break;
          }
          tracker = 7;
          break;
        }
      }
      if(dir == 'e'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x+5,y,w,h})){
          if(m.poisonFlag){
            poisonFlag = true;
            //break;
          }
          dir = 's';
          break;
        }
      }
      if(dir == 'w'){
        if(rectCollision(m.currentCollisionInfo,new int[]{x-5,y,w,h})){
          if(m.poisonFlag){
            poisonFlag = true;
            //break;
          }
          dir = 's';
          break;
        }
      } 
    }
  }
}