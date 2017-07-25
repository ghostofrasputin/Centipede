
class Player {
  private int x, y, size, speed;
  
  Player(int x, int y){
    this.x = x;
    this.y = y;
    this.size = 10;
    this.speed = 10;
  }
  
  void display(){
    drawSprite();
  }
  
  void update(){
    if(keyPressed){
      // west
      if(key == 'a' || key == 'A'){
        x-=speed;
      }
      // east
      if(key == 'd' || key == 'D'){
        x+=speed;
      } 
    }
    
  }
  
  private void drawSprite(){
    rect(x,y,size,size);
  }
    
}