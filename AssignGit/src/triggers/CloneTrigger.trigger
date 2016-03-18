trigger CloneTrigger on Lead (before update) {



    if(checkRecursive.runOnce())
    {
    //write your code here            
    
Lead[] accsToClone = new Lead[]{};
Lead[] accsToSave = new Lead[]{};
for (Lead record:trigger.new)
    {
  
    accsToClone.add(record);
    }
if (accsToClone.size() > 0)
    {
    for (Lead record:accsToClone)
    {
       Lead theClone = record.clone(true,true);
        theClone.LastName = theClone.LastName + ' Partner'; 
        theClone.Company=theClone.Company;
        theClone.Status= theClone.Status;
        theClone.Follow_up__c=theClone.Follow_up__c;
        accsToSave.add(theClone);
    }

    insert accsToSave;
    }
    }}