global with sharing class custableExtension {
   // Extension class for 
  
   private ApexPages.StandardController controller {get; set;}
   public string conName {get; set ;}
   public string Contactdel {get; set;}
   public static Contact contactids {get; set{new contact();}}
   public list<Account> Acclst{get;set;}
   Public id AccountID {get; set;}
   public List<Contact> contacts {get; set;}
   public string recid{get;set;}
   public  Contact ac;
   public Integer size {get; set;}
   
   public custableExtension(ApexPages.StandardController controller){
         // constructor for custable extension
    AccountID= ApexPages.currentPage().getParameters().get('id'); // retriving id from url
    Acclst = [select Name from Account where id=:AccountID ];
    system.debug(Acclst);
  
   }
   
  

    
        @RemoteAction    // remote action method
        global static void getContact(Id contactsid) {
       // system.debug('222'+contactsid);
          contactids = [SELECT Id, Name FROM Contact where Id=:contactsid];
          if (contactids  != null)
          delete contactids;   
        
          
            }
            

        public void searchAlphabetical()
        {    // for alphabetical search
        conName= conName + '%';
         contacts=[select id, firstname,lastname from Contact where Accountid =:AccountID AND  Name  LIKE: conName ];
        
        }
        
      public pagereference Previous()
      {          // redirect to list of account
       pagereference refpre =new pagereference('/apex/View_list_account');
       refpre.setredirect(true);
       return refpre;
      
      }
  
      
       public pagereference deleteContactAll()
       {    // delete all contacts
       contacts=[select id, FirstName, LastName from Contact where AccountId=:AccountID];
       system.debug('-->'+ contacts);
      delete contacts;
       pagereference refdel =new pagereference('/apex/View_list_account');
       return refdel;
       }
        
   

      public void setupContacts()
      {    // retreive list of contacts
      
      System.debug(AccountID);
       
         contacts=[select id, FirstName, LastName from Contact where AccountId=:AccountID];
         system.debug(contacts);
          }
    
  
   }