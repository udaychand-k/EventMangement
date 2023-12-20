public class EventUtilityTest {
	
    public static Id getEventData()
    {
        Event__c eventObj = new Event__c();
        
        eventObj.Name__c='Test Event';
        eventObj.Organizer__c = OrganizerUtilityTest.getOrganizerData();
        eventObj.Start__c = System.now();
        eventObj.End__c = System.now().addDays(2);
        
		insert eventObj;
        
        return eventObj.Id;
	}
}