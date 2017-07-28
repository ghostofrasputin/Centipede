//----------------------------------------------------------
// Centipede class
//---------------------------------------------------------- 

class Centipede {
  
  ArrayList<Segment> segments;
  Segment head, middle;
  int [] startPos = {0,(int)random(0,33)};
   
  Centipede(int cent_length){
    this.segments = new ArrayList<Segment>();
    int yDiff = 0;
    int spacing = 12;
    for(int i=0; i<cent_length; i++){
      Segment segment;
      if(i==0){
        segment = new Segment(322+yDiff,-10);
      } else {
        segment = new Segment(322+yDiff,-10);
      }
      segments.add(segment);
      yDiff -= segment.h+spacing;
    }
    this.head = segments.get(0);
    //this.middle = 
  }
  
  void display(){
    for(int i=0; i<segments.size(); i++){
      Segment s = segments.get(i);
      s.display();
    }
  }
  
  void update(){
    ArrayList<Segment> destroyList = new ArrayList<Segment>();
    for(int i=0; i<segments.size(); i++){
      Segment s = segments.get(i);
      for(int j=0; j<bullets.size(); j++){
        Bullet b = bullets.get(j);
        if(rectCollision(b.collisionInfo, new int[]{s.x,s.y,s.w,s.h})){
          bullets.remove(j);
          destroyList.add(s);
          break;
        }
      }
      s.update();
    }
    // remove hit segments if any were hit
    // create a new mushroom at it's location
    // and add it to the shrooms list
    if(destroyList.size()>0){
      for(int k=0; k<destroyList.size(); k++){
        Segment hitSegment = destroyList.get(k);
        Mushroom m = new Mushroom(hitSegment.x,hitSegment.y);
        shrooms.add(m);
        segments.remove(hitSegment);
      }
    }
  }
  
  void calculatePath(){
    
  }
  
  void roamingBehavior(){
  
  }
  
}