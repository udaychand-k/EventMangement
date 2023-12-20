trigger LocationTrigger on Location_Address__c (After insert) {
	
    if(Trigger.isAfter && Trigger.isInsert)
    {
         LocationTriggerHandler.validateAddress(Trigger.newMap);
        
    }
}