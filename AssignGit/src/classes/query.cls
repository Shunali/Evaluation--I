public with sharing class query {

public void personAccount()
{
List<account> record =[select id from account where Persons_account__c = false ];
for (account a : record)
{
System.debug(a);
}

for (integer i=0; i<record.size();i++)
{
System.debug(record[i]);
}
}


public void opportunityRecord()
{
List<Opportunity> record =[select Id, Name FROM Opportunity where Account !=null and DeliveryInstallationStatus__c= 'In progress'];
System.debug(record);
set<account> sets = new set<account>();
List <account>L=([select id  from account]);
for (account a: L)
{
    sets.add(a);
   System.debug(sets);
}


Map<Id,Opportunity> B = new Map<Id,Opportunity>([SELECT Id,AccountId FROM Opportunity]);
System.debug(B);

}


public void updateAccount()
{
integer count=0;
list<Account> acc= new List<Account>();
List <Account>a =[SELECT id FROM Account WHERE Name LIKE 'a%'];
for( Account ac : a){
count++;
    ac.name= 'abc1';
    acc.add(ac);
}

update acc;
system.debug(acc);
system.debug(count);

}

public void structAccount()
    {
    list<Account> newaccounts = new List<Account>([select id ,(select id from Opportunities) from Account]);
  system.debug(newaccounts[1].opportunities); 
   map<id, list<Account>> newaccount= new map<id, list<Account>>();
   //  List <Opportunity> newopportunity2 = new List <Opportunity>();
   
     Id idAcc;
     for(Account idvar:newopportunity)
     {
      
      if(!(newaccount.containsKey(idvar.Accountid)))
      {
       //newopportunity2.add(idvar);
       newaccount.put(idvar.Accountid, New List<Opportunity> {idvar});
       
      }
      else
      {
       newaccount.get(idvar.Accountid).add(idvar);
      }
      
     }
     system.debug(newaccount);
    }



public void sortCampaignAsc()
{
list<campaign> cc= [select name from campaign order by name asc limit 10];
system.debug(cc);
}

public void sortCampaigeDesc()
{
list<campaign> cc= [select name from campaign order by name desc limit 10];
system.debug(cc);
}


public void contactModifiedDate()
{
list<contact> cc= [Select name,id  From Contact where  LastModifiedDate = Today];
system.debug(cc);

}



 
}