Particle [] xian;
void setup()
{
  size(700, 700);
  xian = new Particle[500];
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
    dSpeed = Math.random()*10;
    dTheta = Math.random()*2*Math.PI;
  }
  public void move()
  {
    /*dX = dX + Math.cos(dTheta) * dSpeed;
    dY = dY + Math.sin(dTheta) * dSpeed;*/
    dX += Math.cos(dTheta) * dSpeed;
    dY += Math.sin(dTheta) * dSpeed;
  }
  public void show()
  {
    fill(255, 0, 0);
    ellipse((float)dX, (float)dY, 7, 7);
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
    dY2 = 250;
  }
  public void move()
  {
    dX2 = dX2 + (int)(Math.random()*5)-2;
    dY2 = dY2 + (int)(Math.random()*19)-9;
  }
  public void show()
  {
    fill(0, 0, 255);
    ellipse(dX2, dY2, 30, 30);
  }
}
class JumboParticle extends NormalParticle
{
	public void show()
  {
    fill(255);
    ellipse((float)dX, (float)dY, 50, 50);
  }
}