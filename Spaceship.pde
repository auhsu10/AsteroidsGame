Spaceship shipone = new Spaceship();

class Spaceship extends Floater { 
  public Spaceship(){
    corners=10;
    xCorners=new int[]{28,20,-9,-12,-25,-25,-12,-9,20};
    yCorners=new int[]{0,6,6,9,9,-9,-9,-6,-6,0};
    myColor=color(200,200,200);
    myCenterX=300;
    myCenterY=300;
    myXspeed=0;
    myYspeed=0;
    myPointDirection=0;
  }
  public void hyperspace(){
    myXspeed=0;
    myYspeed=0;
    myCenterX=Math.random()*600;
    myCenterY=Math.random()*600;
  }
  public void setCenterX(){
    myCenterX+=myXspeed;
  }
  public double getCenterX(){
    return myCenterX;
  }
  public void setCenterY(){
    myCenterY+=myYspeed;
  }
  public double getCenterY(){
    return myCenterY;
  }
  public double getRotate(){
    return myPointDirection;
  }
  public void setXspeed(double x){
    myXspeed+=x;
  }
  public void setYspeed(double y){
    myYspeed+=y;
  }
  public double getXspeed(){
    return myXspeed;
  }
  public double getYspeed(){
    return myYspeed;
  }
  public void show(){
    stroke(0);
    fill(160);
    beginShape();
    for(int i=0;i<xCorners.length;i++){
      vertex((float)(myCenterX+xCorners[i]),(float)(myCenterY+yCorners[i]));
    }
    endShape();
  }
}
