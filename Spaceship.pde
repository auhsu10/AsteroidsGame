class Spaceship extends Floater { 
  private int[] windowX, windowY,plumeX,plumeY;
  public Spaceship(){
    corners=16;
    xCorners=new int[]{30,25,20,-9,-12,-30,-28,-20,-20,-28,-30,-12,-9,20,25,30};
    yCorners=new int[]{0,4,6,6,10,10,7,7,-7,-7,-10,-10,-6,-6,-4,0};
    windowX=new int[]{28,24,15,15,24,28};
    windowY=new int[]{0,4,6,-6,-4,0};
    plumeX=new int[]{-22,-32,-40,-32,-22};
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
      line(24,6,34,8);
      line(24,-6,34,-8);
    }
    if(APressed==true){
      //draw the plume
      stroke(255);
      line(22,6,22,20);
    }
    if(DPressed==true){
      //draw the plume
      stroke(255);
      line(22,-6,22,-20);
    }
  }
  public void hyperspace(){
    background(60,125,250);
    myXspeed=0;
    myYspeed=0;
    myCenterX=Math.random()*600;
    myCenterY=Math.random()*600;
  }
}
