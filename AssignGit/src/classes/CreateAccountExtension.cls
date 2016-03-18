public class CreateAccountExtension{     // class of the extension of standard controller

private ApexPages.StandardController sc;
public createAccountExtension(ApexPages.StandardController sc) 
{ 
 // constructor of the extension class
} 

public PageReference create_account()
{    // method for referencing to account detail page after account creation

PageReference pg = new PageReference('/001/o');
return pg;
}

}