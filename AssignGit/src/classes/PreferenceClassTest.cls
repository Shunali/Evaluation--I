@isTest
public class PreferenceClassTest {   // Test Class

@isTest
static void testPreferenceClassoneTest() {   // test class method 1
       
    Account a = new Account(name='Tester');
    insert a;
    
    List<Preference__c > Preferences = new List<Preference__c >();
    Preference__c PreferenceObj1 = new Preference__c (name='Test', PreferenceName__c='Sport Activity', Primary_preference__c= true, Priority__c= '3' ,Name__c=a.id);
    Preferences .add(PreferenceObj1 );
    insert Preferences ;
    
    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);
    
     system.debug('-->'+Preferences );
     system.assertequals(e.Preferences.size(),1);
      
}


@isTest
static void testPreferenceClasstwoTest() {   // test class method 2
       
       
    Account a = new Account(name='Tester');
    insert a;
    
    List<Preference__c > Preferences = new List<Preference__c >();
    Preference__c PreferenceObj1 = new Preference__c (name='Test', PreferenceName__c='Sport Activity', Primary_preference__c= true, Priority__c= '3' ,Name__c=a.id);
    Preferences .add(PreferenceObj1 );
    insert Preferences ;
    Id recid = Preferences.get(0).id;
    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);
    e.recid=recid;
    String nextPage=e.editaction().getUrl();
    system.assertequals('/'+recid+'/e?retURL=%2F'+recid,nextPage);
    
      
}

@isTest
static void testPreferenceClassthreeTest() {   // test class method 3

          
         Account a = new Account(name='Tester');
    insert a;
    
    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);
    e.saveAction();
   system.assertequals(e.Preferences.size(),0);
      
}

@isTest
static void testPreferenceClassfourTest() {   // test class method 4
          
    Account a = new Account(name='Tester');
    insert a;
    
    
    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);
    e.AddPreference();
    e.saveAction();
    system.assertequals(e.Preferences.size(),0);
      
}

@isTest
static void testPreferenceClassfiveTest() {   // test class method 5
          
           Account a = new Account(name='Tester');
    insert a;
    
    List<Preference__c > Preferences = new List<Preference__c >();
    Preference__c PreferenceObj1 = new Preference__c (name='Test', PreferenceName__c='Sport Activity', Primary_preference__c= true, Priority__c= '3' ,Name__c=a.id);
    Preferences .add(PreferenceObj1 );
    insert Preferences ;
    
    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);         
         
         String recid=Preferences.get(0).id;
         e.recid=recid;
        
        String nextPage=e.deletePreference().getUrl();
    system.assertequals('/apex/PreferenceList',nextPage);
         
      
      
}

@isTest
static void testPreferenceClasssixTest() {   // test class method 6
          
    Account a = new Account(name='Tester');
    insert a;

    ApexPages.StandardController sc = new ApexPages.standardController(a);
    PreferenceList e = new PreferenceList (sc);         
 
    List<Preference__c > Preferences = new List<Preference__c >();
    Preference__c PreferenceObj1 = new Preference__c (name='Test', PreferenceName__c='Sport Activity', Primary_preference__c= true, Priority__c= '3' ,Name__c=a.id);
    Preferences .add(PreferenceObj1 );
    insert Preferences ;
    e.save();
    
    Preference__c PreferenceObj2 = new Preference__c (name='Test1', PreferenceName__c='Sport Activity', Primary_preference__c= false, Priority__c= '3' ,Name__c=a.id);
    Preferences .add(PreferenceObj2 );
    insert Preferences;
    e.save();
    List<Apexpages.Message> msg = ApexPages.getMessages();
        boolean b = false;
        for(Apexpages.Message msgs:msg){
            if (msgs.getDetail().contains('This preference is already assigned as Primary Preference'))
                     b = true;
                        }
        system.assert(b);
    }
    

}