//your variable declarations here
public Star[] starsG1=new Star[100];
public ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
public Spaceship shipone = new Spaceship();
public boolean WPressed=false;
public boolean APressed=false;
public boolean SPressed=false;
public boolean DPressed=false;
public boolean FPressed=false;
public boolean gameOver=false;
public double time=0;
public void setup(){
  size(600,600);
  for(int i=0;i<starsG1.length;i++)
    starsG1[i]=new Star();
  for(int i=0;i<25;i++)
    rocks.add(i,new Asteroid());
}
public void draw(){
  background(0);
  if(gameOver==false)
    time+=0.016;
  for(int i=0;i<starsG1.length;i++)
    starsG1[i].show();
  shipone.show();
  shipone.showWindowPlume();
  shipone.move();
  for(int i=0;i<rocks.size();i++){
    float d=dist((float)shipone.getX(),(float)shipone.getY(),(float)rocks.get(i).getX(),(float)rocks.get(i).getY());
    if(d<=25){
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
  stroke(255);
  fill(50,50,50,50);
  beginShape();
  vertex(50,0);
  vertex(75,30);
  vertex(525,30);
  vertex(550,0);
  endShape();
  fill(250);
  textAlign(CENTER);
  textSize(15);
  text("Time: "+(int)time+" seconds",175,20);
  text("Number of Asteroids left: "+rocks.size(),400,20);
  if(rocks.size()==0){
    gameOver=true;
    stroke(255);
    fill(50,50,50,50);
    beginShape();
    vertex(200,265);
    vertex(400,265);
    vertex(400,320);
    vertex(200,320);
    vertex(200,265);
    endShape();
    noStroke();
    fill(250);
    textSize(25);
    text("Game Over!",300,300);
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
  if(keyCode==70){
    FPressed=true;
  }
  if(key=='h'||key=='H'){
    shipone.hyperspace();
  }
  if(key=='r'||key=='R'){
    if(gameOver==true)
      gameOver=false;
    for(int i=rocks.size()-1;i>=0;i--){
      rocks.remove(i);
    }
    for(int i=0;i<25;i++){
      rocks.add(i,new Asteroid());
    }
    shipone.hyperspace();
    time=0;
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
  if(keyCode==70){
    FPressed=false;
  }
}
