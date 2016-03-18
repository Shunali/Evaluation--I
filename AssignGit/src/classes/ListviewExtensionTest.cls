@isTest
public class ListviewExtensionTest {   // Test Class


// @isTest
static void testListviewExtensionTest() {   // test class method 1
        
        Account c = new Account(name ='abc');  // inserting name in account
        insert c;
        
         ApexPages.StandardController sc = new ApexPages.standardController(c);   // constructor of standard controller
         accsearchcontroller obj = new accsearchcontroller(sc);           

        
        obj.searchstring='a';       
        obj.search();
        List<Apexpages.Message> msg = ApexPages.getMessages();
        boolean b = false;
        for(Apexpages.Message msgs:msg){
            if (msgs.getDetail().contains('Input atleast 3 character'))
                     b = true;
                        }
        system.assert(b);
   
   
          obj.searchstring='abc';       
          obj.search();
          system.assertequals(1, obj.acc.size());
  
          obj.clear();                
          system.assertequals(0,obj.acc.size());
 
    }

//@isTest
static void testListviewExtensionAccountlinkTest() {   // test class method 2

         Account c = new Account(name ='abc');  
         insert c;
         ID AccIdChosen=c.id;

         ApexPages.StandardController sc = new ApexPages.standardController(c);   // constructor of standard controller
         ListviewExtension obj = new ListviewExtension(sc);             // constructor of search controoler
        
          AccIdChosen=obj.AccIdChosen;
          String nextPage=obj.Redirect().getUrl();
          system.assertequals('/apex/Account_related_contact?id='+AccIdChosen,nextPage);
          
          obj.conName='a';    // for searching through alphabetical scal
          obj.searchAlphabetical();
          system.assertequals(1,obj.a1.size());
 
}

@isTest
static void testListviewExtensionAccToConTest() {
 
         Account c = new Account(name ='abc');  // inserting name in account
         insert c;
      
         List<Contact> contacts = new List<Contact>();
         Contact contact1 = new Contact(LastName = 'ALastName1', AccountId = c.id);// Adding contacts to the list
         Contact contact2 = new Contact(LastName = 'LastName2', AccountId = c.id);

        contacts.add(contact1);   // Inserting new contacts
        contacts.add(contact2);

         insert contacts;
       
         ApexPages.StandardController sc = new ApexPages.standardController(c);   // constructor of standard controller
         custableExtension obj = new custableExtension(sc);             // constructor of search controoler
        
       
         obj.conName='a';    // for searching through alphabetical scal
         obj.AccountID=c.Id;
         obj.searchAlphabetical();
         system.assertequals(1,obj.contacts.size());
         
         String nextPage=obj.Previous().getUrl();
         System.assertEquals('/apex/View_list_account',nextPage);
         
         obj.setupContacts();
         System.assertEquals(2,obj.contacts.size());
     
          /*Id param=  contact1.id   ;      
         custableExtension.getContact(param);  
        custableExtension.getContact(param);  
       
         System.assertequals(1,obj.contacts.size());
        */
        
         obj.deleteContactAll();
       //  System.assertEquals(0,obj.contacts.size());
         obj.deleteContactAll();
         System.assertEquals(0,obj.contacts.size());
         
}

}