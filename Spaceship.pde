public class Spaceship extends Floater { 
  private int[] windowX, windowY,plumeX,plumeY;
  public Spaceship(){
    corners=16;
    xCorners=new int[]{15,10,5,0,-12,-15,-14,-6,-6,-14,-15,-12,0,5,10,15};
    yCorners=new int[]{0,4,6,6,10,10,7,7,-7,-7,-10,-10,-6,-6,-4,0};
    windowX=new int[]{14,12,8,8,12,14};
    windowY=new int[]{0,4,5,-5,-4,0};
    plumeX=new int[]{-8,-18,-25,-18,-8};
    plumeY=new int[]{6,4,0,-4,-6};
    myColor=color(200,200,200);
    myCenterX=300;
    myCenterY=300;
    myXspeed=0;
    myYspeed=0;
    myPointDirection=0;
  }
  public void showWindowPlume(){
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);
    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    //draw the window
    fill(10,90,240);
    beginShape();
    for (int i = 0; i < windowX.length; i++)
      vertex(windowX[i], windowY[i]);
    endShape();
    if(WPressed==true){
      //draw the plume
      noStroke();
      fill(220,70,45);
      beginShape();
      for (int i = 0; i < plumeX.length; i++)
        vertex(plumeX[i],plumeY[i]);
      endShape();
    }
    if(SPressed==true){
      //draw the plume
      stroke(255);
      line(12,6,22,8);
      line(12,-6,22,-8);
    }
    if(APressed==true){
      //draw the plume
      stroke(255);
      line(12,6,12,18);
    }
    if(DPressed==true){
      //draw the plume
      stroke(255);
      line(12,-6,12,-18);
    }
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void hyperspace(){
    if(gameOver==false);
      background(60,125,250);
    myXspeed=0;
    myYspeed=0;
    myCenterX=Math.random()*600;
    myCenterY=Math.random()*600;
    myPointDirection=Math.random()*600;
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public double getXspeed(){
    return myXspeed;
  }
  public double getYspeed(){
    return myYspeed;
  }
  public double getPointDirection(){
    return myPointDirection;
  }
}
