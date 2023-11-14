//your variable declarations here
Star[] starsG1=new Star[500];
public void setup(){
  size(600,600);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i]=new Star();
}
public void draw(){
  background(0);
  for(int i=0;i<starsG1.length;i++){
    starsG1[i].show();
  }
  shipone.show();
} 

public void keyPressed(){
  if(key=='w'||key=='W'){
    shipone.accelerate(0.2);
  }
  if(key=='s'||key=='S'){
    shipone.accelerate(-1*0.2);
  }
  if(key=='a'||key=='A'){
    shipone.turn(-1*0.01);
  }
  if(key=='d'||key=='D'){
    shipone.turn(0.01);
  }
  if(key=='h'||key=='H'){
    shipone.hyperspace();
  }
}
