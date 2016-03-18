Trigger EmployeesTrigger on Employees__c (after insert, after update, before insert, before update,before delete,after delete,after undelete)
{
 
 if(trigger.isBefore && trigger.isinsert)
 {
   system.debug(trigger.new +'@@@');
 }
    if(trigger.isBefore && trigger.isupdate)
 {
  
     system.debug(trigger.oldmap + '###');
 }
 if(trigger.isBefore && trigger.isdelete)
 {
  
     system.debug(trigger.oldmap+'!!!!');
 }
 
    
    
    if(trigger.isAfter && trigger.isinsert)
 {
  
   system.debug(trigger.newmap + '((');
 }
    
    if(trigger.isAfter && trigger.isupdate)
 {
 
   system.debug(trigger.newmap + '%%');
 }   
 if(trigger.isAfter && trigger.isdelete)
 {
  //Employee__c emp = trigger.new.map;
   //system.debug(emp);
   system.debug(trigger.newmap + '^^');
 }
 if(trigger.isAfter && trigger.isundelete)
 {
  //Employee__c emp = trigger.new.map;
   //system.debug(emp);
   system.debug(trigger.newmap + '**');
 }   
 
}