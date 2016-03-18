Public Class ComponentController{

    Public id AccountID ;  //   declaring AccountID variable
    
    public List<Account> lstAccount=new List<Account>();   // intializing list of account
    public List<Contact> lstContact=new List<Contact>();
    Public ComponentController(){
    
    AccountID=ApexPages.currentPage().getParameters().get('id');  // get id from the url
    }
    
    public List<Account> getLstAccount(){
        return [select Id,Name,Email_Address__c,Website from Account];  // query for accounts
    }
     public Integer getCountAccount(){
        return getLstAccount().size();   // returning the size of account
    }
    public List<Contact> getLstContact(){       // query for contacts
        return [select Id from Contact where AccountId=:AccountID ]; 
    }
     public Integer getCountContact(){
        return getLstContact().size();   // returning the size of test
    }
}