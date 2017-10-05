Particle [] xian;
void setup()
{
  size(700, 700);
  xian = new Particle[1500];
  for (int i = 0; i < xian.length; i++)
  {
    xian[i] = new NormalParticle();
  }
  xian[0] = new OddballParticle();
  xian[1] = new JumboParticle();
}
void draw()
{
  background(20);
	for (int i = 0; i < xian.length; i++)
  {
    xian[i].move();
    xian[i].show();
  }
}
class NormalParticle implements Particle
{
  double dX, dY;
  double dSpeed, dTheta;
  int myColor;
	NormalParticle()
  {
    dX = 350;
    dY = 350;
    dSpeed = (Math.random()*10)+1;
    dTheta = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  public void move()
  {
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
    /*if (dX >= 1000 || dX <= -300) //makes stars go in 1-d line
      dX = 350;
      dY = 350;
    if (dY >= 1000 || dY <= -300)
      dX = 350;
      dY = 350;*/
    if (dX >= 1000)
    {
      dX = 350;
      dY = 350;
    }
    else if (dX <= -300)
    {
      dX = 350;
      dY = 350;
    }
    else if (dY >= 1000)
    {
      dX = 350;
      dY = 350;
    }
    else if (dY <= -300)
    {
      dX = 350;
      dY = 350;
    }
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)dX, (float)dY, 9, 3);
  }
}
interface Particle
{
	public void show();
  public void move();
}
class OddballParticle implements Particle
{
	int dX2, dY2;
  OddballParticle()
  {
    dX2 = 250;
    dY2 = 350;
  }
  public void move()
  {
    dX2 = dX2 + (int)(Math.random()*5)-2;
    dY2 = dY2 + (int)(Math.random()*19)-9;
  }
  public void show()
  {
    noStroke();
    fill(0, 0, 255);
    rect(dX2, dY2, 30, 30);
  }
}
class JumboParticle extends NormalParticle
{
	public void show()
  {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    ellipse((float)dX, (float)dY, 50, 50);
  }
}