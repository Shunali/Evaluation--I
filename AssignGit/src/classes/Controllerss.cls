public with sharing class Controllerss   {

    public String count { get; set; }
 private ApexPages.StandardController controller {get; set;}
 Public Account A;
 public Contact contact{get;set;}
public List<Contact> lstContact{get;set;}
    public  Contact ac;
    public Controllerss(){
  A.id = ApexPages.currentPage().getParameters().get('id');
  system.debug(A.id);
     lstContact=[Select Name,Id from Contact where AccountId=:A.id];
    Integer count =[Select count() from Contact where AccountId=:A.id];
  system.debug('## count' + count);
   }
  

  
   }