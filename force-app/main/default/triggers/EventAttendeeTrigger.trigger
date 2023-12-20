trigger EventAttendeeTrigger on Event_Attendee__c (After insert,After update) {
    if((Trigger.isInsert && Trigger.isAfter)|| (Trigger.isAfter && Trigger.isUpdate) )
    {
        EventAttendeeTriggerHandler.sendConfirmationEmail(Trigger.newMap);
        
    }
}