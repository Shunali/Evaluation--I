@isTest

public class TestclassPreferenceTrigger
{    // class for trigger
    @isTest
    static void testPreferencetTrigger_one()   // test method for trigger
      {
              List<Account> AccList =new List <Account>();   // Creating and inserting account record
              Account ac=new Account(name='abc',Domain__c='yahoo.com');
              AccList.add(ac);
              
                  try{         // try catch block for exception
                  insert AccList;
                  }
                  catch(exception e)
                  {
                  System.debug(e);
                  }   
   
             Preference__c PreferenceObj = new Preference__c ();  // Creating and inserting Preference object Record
             PreferenceObj.name='Test';
             PreferenceObj.PreferenceName__c='Training';
             PreferenceObj.Primary_preference__c=true;
             PreferenceObj.Priority__c='5';
             PreferenceObj.Name__c=AccList.get(0).id;
             
                 try {         // try catch block for exception
                 insert PreferenceObj;
                 }
                 catch(exception e){
                  System.debug(e);
                 }     
    
     
             list<account> acc= [select Primary_preference__c from account where id =:PreferenceObj.Name__c];
             system.assertequals('Training',acc.get(0).Primary_preference__c );   // assertion for check the condition
             
             
             Preference__c PreferenceObj1 = new Preference__c ();  // Creating and inserting Preference object Record
             PreferenceObj1.name='Test1';
             PreferenceObj1.PreferenceName__c='Training';
             PreferenceObj1.Primary_preference__c=false;
             PreferenceObj1.Priority__c='5';
             PreferenceObj1.Name__c=AccList.get(0).id;
             
             try {
                 insert PreferenceObj1;
                 System.assert(false, 'exception expected');
             } catch (Exception e) {
               String message = e.getMessage();
               System.assert(message.contains('This preference is already assigned as Primary Preference'), 'message=' + message);
}
             
     }


}