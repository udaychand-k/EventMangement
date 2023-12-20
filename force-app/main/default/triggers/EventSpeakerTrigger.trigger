trigger EventSpeakerTrigger on Event_Speaker__c(before insert,before update) {
	if(Trigger.isBefore && Trigger.isInsert)
    {
       System.debug(Trigger.new);

        if(EventSpeakerTriggerHandler.checkConflict(Trigger.New))
        {
                    	Trigger.New[0].Speaker__c.addError('The Speaker is already Booked, Please choose another Speaker');
        }    
	}
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        Trigger.New[0].addError('You can\'t update the Event once the speaker is assigned.');
    }
}