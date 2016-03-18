global with sharing class AccountRemoter {
public String accountName {get; set;}
 public static Account account {get; set;}
 public AccountRemoter()
 {}
@RemoteAction
global static Account getAccount(String accountName)
{

account = [select Id,Name from account where Name =: accountName];
return account;
}



}