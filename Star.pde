class Star //note that this class does NOT extend Floater
{
  private int myColor, xPosition, yPosition, mySize;
  public Star(){
    myColor=color((int)(Math.random()*110),50,(int)(Math.random()*240));
    xPosition=(int)(Math.random()*600);
    yPosition=(int)(Math.random()*600);
    mySize=(int)(Math.random()*4);
  }
  public void show(){
    fill(myColor);
    ellipse(xPosition,yPosition,mySize,mySize);
  }
}
