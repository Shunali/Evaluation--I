trigger caseTrigger on Case (before insert){
caseTriggerHandler ocaseTriggerHandler = new caseTriggerHandler();

if(trigger.isBefore && trigger.isInsert)
{
     ocaseTriggerHandler.onBeforeInsert(trigger.new);

}
}