public with sharing class custable {

     public string recid{get;set;}

   public string row{ get; set;}
   public list<Account> Acclst{get;set;}
   Public Account A;

   public List<Contact> contacts {get; set;}

   public custable(){

   Acclst = [select Id,Name from Account ];
   contacts=null;
   }

   public pagereference deleteAccount()
   {
   account ac=[select id,name from account where id=:recid];
   delete ac;


   pagereference ref =new pagereference('/apex/custable');
   ref.setredirect(true);
   return ref;

  }

  public void setupContacts()
  {
     contacts=[select id, FirstName, LastName from Contact where AccountId=:recId];
      }
   }