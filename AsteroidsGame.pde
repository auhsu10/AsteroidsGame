//your variable declarations here
Star[] starsG1=new Star[500];
Spaceship shipone = new Spaceship();
public boolean WPressed=false;
public boolean APressed=false;
public boolean SPressed=false;
public boolean DPressed=false;
public void setup(){
  size(600,600);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i]=new Star();
}
public void draw(){
  background(0);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i].show();
  shipone.show();
  shipone.showWindowPlume();
  shipone.move();
  if(WPressed==true){
    shipone.accelerate(0.1);
  }
  if(SPressed==true){
    shipone.accelerate(-1*0.1);
  }
  if(APressed==true){
    shipone.turn(-1*4);
  }
  if(DPressed==true){
    shipone.turn(4);
  }
} 

public void keyPressed(){
  if(keyCode==87){
    WPressed=true;
  }
  if(keyCode==83){
    SPressed=true;
  }
  if(keyCode==65){
    APressed=true;
  }
  if(keyCode==68){
    DPressed=true;
  }
  if(key=='h'||key=='H'){
    shipone.hyperspace();
  }
}

public void keyReleased(){
  if(keyCode==87){
    WPressed=false;
  }
  if(keyCode==83){
    SPressed=false;
  }
  if(keyCode==65){
    APressed=false;
  }
  if(keyCode==68){
    DPressed=false;
  }
}
