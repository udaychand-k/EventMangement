@isTest
public class EventSpeakerTriggerHandlerTest {
    
    public static Event_Speaker__c eventSpeakerObj = new Event_Speaker__c();
     
    @testSetup static void commonDataSetup()
    {
        
    }
    
    @isTest static void EventSpeakerTriggerConflictTest()
    {
        eventSpeakerObj = EventSpeakerUtilityTest.getEventSpeakerData();
        Event_Speaker__c eventSpeakerObj2 = new Event_Speaker__c();
        
        Test.startTest();
        
        Database.SaveResult result1 = Database.insert(eventSpeakerObj);
        Database.SaveResult result2 = Database.insert(eventSpeakerObj2);
        
        Test.stopTest();
        
        System.Assert(result2.isSuccess());
        
       
	}
    
     @isTest static void EventSpeakerTriggerNoConflictTest()
    {
        eventSpeakerObj = EventSpeakerUtilityTest.getEventSpeakerData();
        system.Debug(eventSpeakerObj);

        try{
        
        Test.startTest();
       
        Database.SaveResult result1 = Database.insert(eventSpeakerObj);

        Test.stopTest();
        
        }
        catch (Exception e)
        {
            System.assertEquals('The Speaker is already Booked, Please choose another Speaker', e.getMessage());
		}
       
	}
    

}