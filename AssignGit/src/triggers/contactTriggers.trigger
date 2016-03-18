trigger contactTriggers on Contact (before insert) {

DomainTriggerHandler  oDomainTriggerHandler = new DomainTriggerHandler();
if(trigger.isBefore && trigger.isInsert )
{
oDomainTriggerHandler.onBeforeInsert(trigger.new);
}

}