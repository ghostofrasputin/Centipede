/***********************************************************
 * Program: Atari's Centipede remake project               *
 * Author: Jacob Preston                                   *
 *                                                         *
 * Instructions:                                           *
 * move back and forth with A and D                        *
 * shoot by pressing the O button                          * 
 *                                                         *
 ***********************************************************/

//----------------------------------------------------------
// Global variables
//----------------------------------------------------------
Player humanoid = new Player(200,750);
 
void setup(){
  size(650,800);
}

void draw(){
  background(0);
  humanoid.display();
  humanoid.update();
}

void generateMushrooms(){

}