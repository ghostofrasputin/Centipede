

class Mushroom {
  private int x, y;
  private int hits;
  
  Mushroom(int x, int y){
    this.x = x;
    this.y = y;
    this.hits = 0;
  }
  
  void display(){
    // it takes 4 hits to destroy a mushroom
    stroke(atomic_blue);
    strokeWeight(3);
    switch(hits){
      case 0:
        fill(atomic_purple);
        arc(x, y, 15, 15, PI, TWO_PI);
        rect(x-3,y,5,7);
        fill(atomic_blue);
        line(x-7,y,x+7,y);
        break;
      case 1:
        fill(atomic_purple);
        arc(x, y, 15, 15, PI, TWO_PI);
        rect(x-3,y,5,7);
        fill(atomic_blue);
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
    // check for bullet/mushroom collision
    switch(hits){
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      // mushroom is destroyed:
      case 4:
        mushrooms.remove(this);
        break;
      default:
        break;
       
    }
  }
    
}