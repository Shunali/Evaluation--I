public class accsearchcontroller {  // Extension for searching account from the search panel
 
    public accsearchcontroller(ApexPages.StandardController controller) {
     // constructor for accsearchcontroller
    }
             public list <account> acc {get;set;}       // list of account
             public string searchstring {get;set;}      
         
 
        public void search(){    // for searcing string from the list of account
   
            if(searchstring.length()<3){  // throw error msg if length if less than 3
                      
                 ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Input atleast 3 character');
                ApexPages.addMessage(msg); 
                system.debug('-->@@@'+msg);
     
                        }
            else{
      
                String searchquery='select name,id from account where name like \'%'+searchstring+'%\' Limit 20';
                 acc= Database.query(searchquery);
                        }
           }  
           
           
      public void clear(){        // function for clearing the text box
           
         
            SearchString = '';
            
            if(acc != null){   //  acc name given to the list of account
                  acc.clear();
                  
                   }
            }
 }