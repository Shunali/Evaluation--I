public class PreferenceTriggerHelper {

    public void primaryPreferenceOnAInsert()
    {

        List<Preference__c> ListPreference = new List<Preference__c>();
        for( Preference__c PreferenceObject :(List<Preference__c>)(trigger.new))  // Iterating list of Preferences

            {        
    
             ListPreference .add(PreferenceObject );
            
            }//end of for 
        
        if(ListPreference.get(0).Primary_preference__c==true)   // Checking Primary preference checkbox set true or false
          
           {
           
            List<Account> accList = [SELECT Id,Name FROM Account WHERE id =:ListPreference.get(0).Name__c];  // List of account
            for(account ac:accList)
            {
            ac.Primary_preference__c=ListPreference.get(0).PreferenceName__c;  
                      }
            update accList;
                  }

    }//end of primaryPreferenceOnAInsert
    
     public void primaryPreferenceOnBInsert(){
     
      List<Preference__c> ListPreference = new List<Preference__c>();   // Iterating list of Preferences
        for( Preference__c PreferenceObject :(List<Preference__c>)(trigger.new))    

        { 
              List<Account> ListAccount = new List<Account>([select Primary_preference__c from Account where Id=:PreferenceObject.Name__c ]);
              if( ListAccount.get(0).Primary_preference__c== PreferenceObject.PreferenceName__c)
              {
              PreferenceObject .PreferenceName__c.addError('This preference is already assigned as Primary Preference'); 
              } 
        }
     

      } 

}//end of class