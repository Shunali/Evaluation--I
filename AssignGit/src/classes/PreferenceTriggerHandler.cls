public class PreferenceTriggerHandler {   // Handler class for Preference Trigger

     public void onAfterInsert(){   // Method on After insert

            new PreferenceTriggerHelper().primaryPreferenceOnAInsert();   // Calling PreferenceTriggerHelper and its method

     }//end of onAfterInsert Method   
     
      public void onBeforeInsert(){   // Method on Before insert

            new PreferenceTriggerHelper().primaryPreferenceOnBInsert();   // Calling PreferenceTriggerHelper and its method

     }//end of onBeforeInsert Method   

 }