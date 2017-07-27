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
    int spacing = 2;
    for(int i=0; i<cent_length; i++){
      Segment segment;
      if(i==0){
        segment = new Segment(322,yDiff,true);
      } else {
        segment = new Segment(322,yDiff,true);
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
    for(int i=0; i<segments.size(); i++){
      Segment s = segments.get(i);
      s.update();
    }
  }
  
  void calculatePath(){
    
  }
  
  void roamingBehavior(){
  
  }
  
}