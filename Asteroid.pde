public class Asteroid extends Floater {
  private double rotSpeed;
  public Asteroid(){
    rotSpeed=Math.random()*20-10;
    corners=6;
    xCorners=new int[]{48,36,-12,-20,-3,24};
    yCorners=new int[]{0,15,22,-4,-20,-18};
    myColor=color(160,160,160);
    myCenterX=Math.random()*600;
    myCenterY=Math.random()*600;
    myXspeed=Math.random()*3;
    myYspeed=Math.random()*3;
    myPointDirection=Math.random()*100;
  }
  public void show(){
    super.show();
  }
  public void move(){       
    super.move();
    turn(rotSpeed);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
