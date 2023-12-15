//your variable declarations here
public Star[] starsG1=new Star[60];
public ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
public ArrayList <Bullet> bullets = new ArrayList <Bullet>();
public ArrayList <Torpedo> torpedoes = new ArrayList <Torpedo>();
public Spaceship shipone = new Spaceship();
public boolean WPressed=false;
public boolean APressed=false;
public boolean SPressed=false;
public boolean DPressed=false;
public boolean FPressed=false;
public boolean TPressed=false;
public boolean gameOver=false;
public double time=0;
public int shiphealth=100;
public int ammo=100;
public int ammo2=4;
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
  if(bullets.size()>0){
    for(int i=0;i<bullets.size();i++){
      bullets.get(i).show();
      bullets.get(i).move();
      bullets.get(i).accelerate();
      if((bullets.get(i).myCenterX>width)||(bullets.get(i).myCenterY>height))
        bullets.remove(i);
    }
  }
  if(torpedoes.size()>0){
    for(int i=0;i<torpedoes.size();i++){
      torpedoes.get(i).show();
      torpedoes.get(i).move();
      torpedoes.get(i).accelerate();
      if((torpedoes.get(i).myCenterX>width)||(torpedoes.get(i).myCenterY>height))
        torpedoes.remove(i);
    }
  }
  for(int i=0;i<starsG1.length;i++)
    starsG1[i].show();
  shipone.show();
  shipone.showWindowPlume();
  shipone.move();
  for(int i=0;i<rocks.size();i++){
    float d=dist((float)shipone.getX(),(float)shipone.getY(),(float)rocks.get(i).getX(),(float)rocks.get(i).getY());
    if(d<=25 && shiphealth>0){
      rocks.remove(i);
      shiphealth-=25;
    }
    else{
      rocks.get(i).show();
      rocks.get(i).move();
    }
  }
  for(int i=0;i<rocks.size();i++){
    for(int j=0;j<bullets.size();j++){
      float r=dist((float)bullets.get(j).getX(),(float)bullets.get(j).getY(),(float)rocks.get(i).getX(),(float)rocks.get(i).getY());
      if(r<=20){
        rocks.remove(i);
        noStroke();
        fill(220,0,0);
        ellipse((float)bullets.get(j).getX(),(float)bullets.get(j).getY(),20,20);
        ellipse((float)bullets.get(j).getX(),(float)bullets.get(j).getY(),20,20);
        bullets.remove(j);
        break;
      }
    }
  }
  for(int i=0;i<rocks.size();i++){
    for(int j=0;j<torpedoes.size();j++){
      float r=dist((float)torpedoes.get(j).getX(),(float)torpedoes.get(j).getY(),(float)rocks.get(i).getX(),(float)rocks.get(i).getY());
      if(r<=40){
        rocks.remove(i);
        noStroke();
        fill(220,0,200);
        ellipse((float)torpedoes.get(j).getX(),(float)torpedoes.get(j).getY(),80,80);
        ellipse((float)torpedoes.get(j).getX(),(float)torpedoes.get(j).getY(),80,80);
        torpedoes.remove(j);
        break;
      }
    }
  }
  if(WPressed==true && shiphealth>0)
    shipone.accelerate(0.15);
  if(SPressed==true && shiphealth>0)
    shipone.accelerate(-1*0.15);
  if(APressed==true && shiphealth>0)
    shipone.turn(-1*8);
  if(DPressed==true && shiphealth>0)
    shipone.turn(8);
  if(FPressed==true && shiphealth>0){
    if(ammo>0){
      ammo--;
      bullets.add(new Bullet());
    }
  }
  if(TPressed==true && shiphealth>0){
    if(ammo2>0){
      ammo2--;
      torpedoes.add(new Torpedo());
    }
  }
  for(int i=0;i<bullets.size();i++){
    if(ammo<=0)
      bullets.remove(i);
  }
  stroke(255);
  fill(50,50,50,50);
  beginShape();
  vertex(50,0);
  vertex(75,30);
  vertex(525,30);
  vertex(550,0);
  endShape();
  beginShape();
  vertex(50,600);
  vertex(75,570);
  vertex(525,570);
  vertex(550,600);
  endShape();
  fill(250);
  textAlign(CENTER);
  textSize(15);
  text("Time: "+(int)time+" seconds",175,20);
  text("Number of Asteroids left: "+rocks.size(),400,20);
  text("Ammo: "+ammo+" bullets   "+ammo2+" torpedoes",205,590);
  text("Ship health: "+shiphealth+"%",420,590);
  if(rocks.size()==0||shiphealth<=0){
    gameOver=true;
    stroke(255);
    fill(50,50,50,50);
    beginShape();
    vertex(200,265);
    vertex(400,265);
    vertex(400,360);
    vertex(200,360);
    vertex(200,265);
    endShape();
    noStroke();
    fill(250);
    if(shiphealth<=0){
      shipone.nullXspeed();
      shipone.nullYspeed();
      fill(240,60,5);
      ellipse((float)shipone.getX(),(float)shipone.getY(),40,40);
      fill(250,140,40);
      ellipse((float)shipone.getX(),(float)shipone.getY(),20,20);
      noStroke();
      fill(250);
      textSize(13);
      text("Your ship is destroyed!",300,325); 
      text("Time: "+(int)time+" seconds",300,350);
    }
    if(shiphealth>0){
      textSize(15);
      text("You win!",300,325);
      text("Time: " +(int)time+" seconds",300,350);
    }
    noStroke();
    fill(250);
    textSize(25);
    text("Game Over!",300,300);
  }
} 

public void keyPressed(){
  if(shiphealth>0){
    if(key=='w'||key=='W')
      WPressed=true;
    if(key=='s'||key=='S')
      SPressed=true;
    if(key=='a'||key=='A')
      APressed=true;
    if(key=='d'||key=='D')
      DPressed=true;
    if(key=='f'||key=='F')
      FPressed=true;
    if(key=='t'||key=='T')
      TPressed=true;
    if(key=='h'||key=='H')
      shipone.hyperspace();
  }
  if(key=='r'||key=='R'){
    shiphealth=100;
    ammo=100;
    ammo2=4;
    if(gameOver==true)
      gameOver=false;
    for(int i=rocks.size()-1;i>=0;i--)
      rocks.remove(i);
    for(int i=bullets.size()-1;i>=0;i--)
      bullets.remove(i);
    for(int i=0;i<25;i++)
      rocks.add(i,new Asteroid());
    shipone.hyperspace();
    time=0;
    redraw();
  }
}

public void keyReleased(){
  if(key=='w'||key=='W'||shiphealth<=0)
    WPressed=false;
  if(key=='s'||key=='S'||shiphealth<=0)
    SPressed=false;
  if(key=='a'||key=='A'||shiphealth<=0)
    APressed=false;
  if(key=='d'||key=='D'||shiphealth<=0)
    DPressed=false;
  if(key=='f'||key=='F'||shiphealth<=0)
    FPressed=false;
  if(key=='t'||key=='T'||shiphealth<=0)
    TPressed=false;
}
