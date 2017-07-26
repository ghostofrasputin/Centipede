//----------------------------------------------------------
// Player class
//---------------------------------------------------------- 

class Player {
  private int x, y, size, speed;
  private boolean rightFlag, leftFlag;
  
  Player(int x, int y){
    this.x = x;
    this.y = y;
    this.size = 10;
    this.speed = 5;
  }
  
  void display(){
    drawSprite();
  }
  
  void update(){
    // left
    if(keys[0] && x>=5){
      x-=speed;
    }
    // right
    if(keys[1] && x<=width-15){
      x+=speed;
    } 
  }
  
  private void drawSprite(){
    fill(255);
    rect(x,y,size,size);
  }
    
}