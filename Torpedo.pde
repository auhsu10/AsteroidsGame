public class Torpedo extends Floater {
  public Torpedo(){
    myColor=color(200,0,160);
    myCenterX=shipone.getX()-4;
    myCenterY=shipone.getY()-4;
    myXspeed=shipone.getXspeed();
    myYspeed=shipone.getYspeed();
    myPointDirection=shipone.getPointDirection();
  }
  public void show(){
    fill(myColor);
    stroke(myColor);
    //draw the polygon
    ellipse((float)myCenterX+4,(float)myCenterY+4,10,6);
  }
  public void move(){
    myCenterX+=myXspeed;
    myCenterY+=myYspeed;
  }
  public void accelerate(){
    super.accelerate(0.25);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
