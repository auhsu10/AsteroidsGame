//your variable declarations here
public Star[] starsG1=new Star[500];
public ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
public Spaceship shipone = new Spaceship();
public boolean WPressed=false;
public boolean APressed=false;
public boolean SPressed=false;
public boolean DPressed=false;
public void setup(){
  size(600,600);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i]=new Star();
  for(int i=0;i<10;i++)
    rocks.add(i,new Asteroid());
}
public void draw(){
  background(0);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i].show();
  shipone.show();
  shipone.showWindowPlume();
  shipone.move();
  for(int i=0;i<rocks.size();i++){
    float d=dist((float)shipone.getX(),(float)shipone.getY(),(float)rocks.get(i).getX(),(float)rocks.get(i).getY());
    if(d<=20){
      rocks.remove(i);
    }
    else{
      rocks.get(i).show();
      rocks.get(i).move();
    }
  }
  if(WPressed==true){
    shipone.accelerate(0.1);
  }
  if(SPressed==true){
    shipone.accelerate(-1*0.05);
  }
  if(APressed==true){
    shipone.turn(-1*6);
  }
  if(DPressed==true){
    shipone.turn(6);
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
  if(key=='r'||key=='R'){
    for(int i=0;i<rocks.size();i++){
      rocks.remove(i);
    }
    for(int i=0;i<10;i++){
      rocks.add(i,new Asteroid());
    }
    redraw();
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
