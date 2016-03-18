@isTest
public class LineItemTest {   // Test Class

@isTest
static void testListviewExtensionTest() {   // test class method 1
         
          List<Contact> contacts = new List<Contact>();
          Contact con = new Contact(LastName = 'abc');  // creating record for new contact
          contacts.add(con);
          insert contacts;    
          system.debug(contacts.get(0).id);

          Merchandise__c mer = new Merchandise__c(Name='Reliance',Description__c='xsdc',Price__c=445, Total_Inventory__c=3344);
          insert mer;

          List<Invoice_Statement__c> invoice = new List<Invoice_Statement__c>();
          Invoice_Statement__c inv = new Invoice_Statement__c(Status__c='closed',Name__c=contacts.get(0).id);
          invoice.add(inv);
          insert invoice;
          system.debug('-->'+invoice);
          ID currentId=invoice.get(0).id;
          
        
          Line_item__c line = new  Line_item__c(name= 'lcd', New_client_discount__c=456 
                                            ,Product_Name__c='lcd', Service_Fee__c=565,
                                             Working_hours__c=6, Tax__c=66,
                                             InvoiceStatement__c=invoice.get(0).id);
          system.debug('-->'+line);
          
          ApexPages.StandardController sc = new ApexPages.standardController(line);   // constructor of standard controller
          LineItemExtension obj = new LineItemExtension(sc); 
     
          currentId=obj.currentId;
          obj.getListLabor();
          
         system.assertequals(invoice.size(),1);
      
}


}