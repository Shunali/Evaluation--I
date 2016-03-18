public class DomainTriggerHandler 
{
    public void onBeforeInsert( list<Contact> objC)
    {
        try{
        String[] searchEmailKey=(objC.get(0).email).split('@');
      
        List<Account> arrayAccounts = [select name from Account where Domain__c=: searchEmailKey[1]  limit 1];
        system.debug(searchEmailKey[1]);
        system.debug(arrayAccounts);
        for(Contact c:objC)
        {
            //system.debug('>>>>'+C.Email+'oooooo'); 
        for(Account a:arrayAccounts)
        {
            C.accountID=a.Id;
        }
        } }
        catch(Exception e)
        {
        System.debug('The following exception has occurred: ' + e.getMessage());
        }
      } 
    }