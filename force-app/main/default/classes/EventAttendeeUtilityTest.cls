public class EventAttendeeUtilityTest {
    
    public static Event_Attendee__c getEventAttendeeData()
    {
        Event_Attendee__c eventAttendeeObj = new Event_Attendee__c();
        
        eventAttendeeObj.Name = 'Test Event Attendee';
        eventAttendeeObj.Event__c = EventUtilityTest.getEventData();
        eventAttendeeObj.Attendee__c = AttendeeUtilityTest.getAttendeeData();
        
        return eventAttendeeObj;
    }

}