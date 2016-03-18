public class Basic_programming{
	 integer prime_no;
	public void Prime (Integer prime_no) {  //Overloaded constructor
  
 				  integer m=0,flag=0;    
 				  m=prime_no/2;    
 				 for( integer i=2;i<=m;i++) {    
 						  if(math.mod(prime_no,i)==0){   
 								  System.debug('Number is not prime');    
  								   flag=1;    
  								   break;    
												   }    
									  }    
							  if(flag==0)    
							  System.debug('Number is prime');
  
							}
							
							

 public void Palind (String str)
 {
        String reverse='';
        integer len=str.length();
        for(integer i=len-1;i>-1;i--)
        {   
        reverse=reverse+String.fromCharArray( new List<integer> {str.charAt(i)}); 
        }
        
        System.debug('Reversed String is: '+reverse);
 
        if(str.equals(reverse))
        {
        System.debug('The Given String is Palindrome');
        }
        else
		System.debug('The Given String is not a Palindrome');
}


    
  public void Count(String s)
 {
  integer count=0;
  String[] ch=s.split('');
  for(String i:ch)
  {
   if(i < 'z')
   {
    count++;
   }
   else
   {
    break;
   }
  }
  System.debug('Count='+count);
 }
 
 
 public void non_dup(integer[] num)
 {
  Integer size = num.size();
  Set <Integer> uni_Set = new Set<Integer>();
  for(Integer i=size-1; i>=0; i++)
  {
   uni_Set.add(num[i]);
  }
  
  for(Integer i:uni_Set)
  {
   System.debug(i);
  }
  
 }
 
 
 
 public void rep(String[] str, String rep1, String rep2)
 {
  for(String Temp:str)
  {
   String[] ch = Temp.split('');
   for(Integer i = 0; i< ch.size(); i++)
   {
    if(ch[i] == rep2)
    {
     ch[i]=rep1;
    }
   }
   
   
   System.debug(String.valueOf(ch));
  }
 }
 
 
}