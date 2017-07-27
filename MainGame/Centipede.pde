//----------------------------------------------------------
// Centipede class
//---------------------------------------------------------- 

class Centipede {
  
  ArrayList<Segment> segments;
  Segment head, middle;
   
  Centipede(int cent_length){
    //this.head = new Segment(0,50);
    this.segments = new ArrayList<Segment>();
    int yDiff = 35;
    int spacing = 2;
    for(int i=0; i<cent_length; i++){
      Segment segment = new Segment(322,yDiff);
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
  
}