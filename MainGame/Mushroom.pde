//----------------------------------------------------------
// Mushroom class
//---------------------------------------------------------- 

class Mushroom {
  private int x, y;
  private int hit;
  private int lastHit;
  private int[] currentCollisionInfo;
  private boolean poisonFlag;
  
  Mushroom(int x, int y){
    this.x = x;
    this.y = y;
    this.hit = 0;
    this.lastHit = -1;
    currentCollisionInfo = new int[4];
    this.poisonFlag = false;
  }
  
  void display(){
    // it takes 4 hits to destroy a mushroom
    stroke(blue);
    strokeWeight(3);
    if(poisonFlag){
      stroke(red);
    }
    switch(hit){
      case 0:
        /*rectMode(CENTER);
        fill(255);
        rect(x,y,20,20);
        rectMode(CORNER);*/
        fill(purple);
        if(poisonFlag){
          fill(green);
        }
        arc(x, y, 15, 15, PI, TWO_PI);
        rect(x-3,y,5,7);
        //fill(blue);
        line(x-7,y,x+7,y);
        break;
      case 1:
        fill(purple);
        if(poisonFlag){
          fill(green);
        }
        arc(x, y, 15, 15, PI, TWO_PI);
        //rect(x-3,y,5,7);
        fill(blue);
        line(x-7,y,x+7,y);
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
       
    }
    noStroke();
  }
  
  void update(){
    //update collision info once when there's a hit
    switch(hit){
      case 0:
        updateCollisionInfo(new int[]{x-10,y-10,20,20});
        break;
      case 1:
        updateCollisionInfo(new int[]{x-10, y-10, 20, 20});
        break;
      case 2:
        // updateCollisionInfo();
        break;
      case 3:
        //updateCollisionInfo();
        break;
      default:
        break;
     }
    lastHit = hit;
  }
  
  // this is to make sure the collision info is only
  // updated once, not every time it's called
  void updateCollisionInfo(int[] info){
    if(hit==lastHit) {
      return;
    } else {
      currentCollisionInfo = new int[] {info[0],info[1],info[2],info[3]};
    }
  }
  
  boolean bulletCollision(Bullet b){
    if(rectCollision(b.collisionInfo, currentCollisionInfo)){
      hit++;
      return true;
    } else {
      return false;
    }
  }
   
  void setPoisonFlag(){
    poisonFlag = true;
  }
}