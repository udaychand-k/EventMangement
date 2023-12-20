@isTest
public class EventAttendeeTriggerHandlerTest {
    
    @testSetup static void eventAttendeeCommonData()
    {
        Event_Attendee__c eventAttendeeObj = EventAttendeeUtilityTest.getEventAttendeeData();
        				
        insert eventAttendeeObj;
        
    }
    
    @isTest static void EventAttendeeTriggerHandlerEmailSentTest()
    {
        Test.startTest();
        
        EventAttendeeUtilityTest.getEventAttendeeData();
        
        Test.stopTest();
    }

}