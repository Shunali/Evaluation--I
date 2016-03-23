trigger PreferenceTrigger on Preference__c (after insert, before insert) {

        if(trigger.isAfter) {      

            if(trigger.isinsert){

                        new PreferenceTriggerHandler().onAfterInsert();   // creating the instance of handler class and calling OnAfterInsert

                    }//end of if       

            }//end of if 
    
        else{
 
         if(trigger.isinsert){

            new PreferenceTriggerHandler().onBeforeInsert();      // creating the instance of handler class and calling OnBeforeInsert

                     } 
           }

  }//end of trigger