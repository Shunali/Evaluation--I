Public with sharing class PreferenceList 
{       // Controller class

    public List<Preference__c> Preferences {get; set;}   // declaring the list and variable
    public Preference__c prefrenceObj {get; set;}
    //public List<Account> accList {get; set;}
    public string recid{get;set;}
    public boolean var {get; set;}
    public String AccountID {get; set;} 
    private final Account acct;


 
    public PreferenceList (ApexPages.StandardController controller)
            {       // constructor for PreferenceList 
             this.acct = (Account)controller.getRecord();
             AccountID =acct.id;
             prefrenceObj = new Preference__c();
             Preferences=[select Priority__c, PreferenceName__c from Preference__c where Name__c=:AccountID ORDER BY Priority__c DESC ];
                  // query to arrange preference according to its priority   
            }
      
    
        
    public PageReference AddPreference()
           {  //For adding new reocrd of preferences
                var = true;   // for rerendered
                return null;
           }
    
     
    public pageReference save()
             {
                // for saving the preference record
                prefrenceObj.Name__c=AccountID ;
                   try {
                                
                       insert prefrenceObj ;
                         system.debug('**222**'+prefrenceObj );
                     } catch (DMLException e)
                      {      
                      system.debug('%%%');
                             ApexPages.addMessages(e);
                              return null;
        
                        }

               var=false;  // for rerendered
               return null;
             }
  
  
    public PageReference saveAction()
        
             {  //Cancel Button method
      
            var=false;
            return null;
             }
        
    public pagereference editaction()
     
           {   // for edit preferences record
               pagereference ref =new pagereference('/'+recid+'/e?retURL=%2F'+recid);
               return ref;
           } 
           
           
   public pagereference deletePreference()
   
          {      //Deleting the single record of the preference
          
            List<Preference__c > deleteObj = [SELECT Id FROM Preference__c WHERE id  =:recid];
            delete deleteObj;
            pagereference ref =new pagereference('/apex/PreferenceList');
            return ref;
         
          }
        
    
 }