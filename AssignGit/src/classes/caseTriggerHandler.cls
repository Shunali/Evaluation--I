public class caseTriggerHandler{

 public void onBeforeInsert( list<Case> objc)
    {
                Id newAccountId;  
     Map<String, Contact> contactMap = new Map<String, Contact>();
     Set<String> email = new Set<String>();
       system.debug(objc);
        for (Case createdCase : objc) {
              email.add(createdCase.SuppliedEmail);
              system.debug(email);
              }
              
                Contact[] contactsMatched = [Select Id,AccountId,email from Contact where email IN :email];
                   system.debug(contactsMatched +'%%%%');
     
           for(Contact con :contactsMatched ){
           system.debug('-->' + contactsMatched +'<--');
            contactMap.put(con.Email, con);
                system.debug('@-->' + contactMap +'<--@');
        }
        
        for(Case cs : objc)
        {
            if(contactMap.containsKey(cs.SuppliedEmail) == true){
                cs.ContactId = contactMap.get(cs.SuppliedEmail).Id;
                if(String.isBlank(contactMap.get(cs.SuppliedEmail).AccountId) == false){
                    cs.AccountId = contactMap.get(cs.SuppliedEmail).AccountId;
                }
            }
        }
        
    }   
    


}