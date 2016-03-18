public class Oops {
Integer length,breadth,Area;
public Oops(Integer l, Integer b)
{
length=l;
breadth=b;
} 

public void Area_of_Rectangle()
{
Area= length*breadth;
System.debug('Area'+Area);
}
}