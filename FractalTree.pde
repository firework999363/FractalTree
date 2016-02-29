private double fractionLength = .8; 
private float smallestBranch = 10; 
private double branchAngle = .2;  
private float branchLengthA = 10;
private float branchA = 0.1;
public void setup() 
{   
	size(640,480);    
}
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void drawBranches(float x,float y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	float endX1 = (float)(branchLength*Math.cos(angle1) + x);
	float endY1 = (float)(branchLength*Math.sin(angle1) + y);
	float endX2 = (float)(branchLength*Math.cos(angle2) + x);
	float endY2 = (float)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if (branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,((branchLengthA-1)*branchLength)/branchLengthA,angle1 + branchA);
		drawBranches(endX2,endY2,((branchLengthA-1)*branchLength)/branchLengthA,angle2 - branchA);
	}
} 
public void mouseDragged()//optional
{
  	branchLengthA = branchLengthA + (float)(pmouseY - mouseY)/2;
  	branchA = branchA + (float)(mouseX - pmouseX)/90;
  	if (branchLengthA < 2)
  	{
  		branchLengthA = 2;
  	}
}