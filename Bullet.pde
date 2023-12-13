public class Bullet extends Floater {
  public Bullet(){
    myColor=color(255,50,50);
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
    ellipse((float)myCenterX+4,(float)myCenterY+4,4,4);
  }
  public void move(){
    myCenterX+=myXspeed;
    myCenterY+=myYspeed;
  }
  public void accelerate(){
    super.accelerate(1);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
