public class EventSpeakerUtilityTest {

    public static Event_Speaker__c getEventSpeakerData()
    {
        Event_Speaker__C eventSpeakerObj = new Event_Speaker__c();
        
        eventSpeakerObj.Name='Test Event Speaker';
        eventSpeakerObj.Event__c = EventUtilityTest.getEventData();
        eventSpeakerObj.Speaker__c = SpeakerUtilityTest.getSpeakerData();
        
        return eventSpeakerObj;
	}
}