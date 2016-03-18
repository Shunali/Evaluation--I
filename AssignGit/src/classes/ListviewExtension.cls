public class ListviewExtension{  // define a class for the list of account

    private ApexPages.StandardController controller {get; set;}
    public list<account>a1 {get; set;}       // declaring the list of account
    public String AccIdChosen {get; set;}    // ID of account
    Public string conName{get; set;}          
    


   public ListviewExtension(ApexPages.StandardController controller) {  // Constructor of ListViewExtension
   
       a1= [select Id, Name,Phone,Email_Address__c, Website from account];  // a1 value of pageBlockTable set in View_list_account VF page
       this.controller = controller; 
    }


          public void searchAlphabetical()      // function for alphabetical search
          {
           conName = conName + '%';    // concatenate , for example, A%
           a1=[select Id, Name,Phone,Email_Address__c, Website from account where name LIKE: conName];   // Query for searching letter in account list
          // system.debug('-->' +a1);
        
           }

        
         public PageReference Redirect()  // on clicking managecontact button for particular account redirect to next vf page Account_related_contact 
         {

           List <account> ac=[select id,name from account where id=:AccIdChosen];
           //system.assertEquals(null,ac,'@@@'+AccIdChosen);   
           PageReference newpage = new PageReference ('/apex/Account_related_contact?id='+AccIdChosen);
        
                  //creating page reference instance and redirecting to new vf page
            return newpage;
        }
        

}