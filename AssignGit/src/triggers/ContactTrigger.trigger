trigger ContactTrigger on Contact (after insert) {

List<Account> AccDetail=[Select domain__c from account where domain__c = 'gmail.com'];
List<Contact>ConList= new List<Contact>(trigger.new);
List<String> str = new List<String>();

for(Account acct : AccDetail)
{
system.debug(acct+ '##4$$$');
for(Contact ContactVar : ConList)
{
system.debug(ContactVar);
if(ContactVar.Email == '%'+acct.Domain__c)
{
system.debug('4$$$');
}


}
}

}