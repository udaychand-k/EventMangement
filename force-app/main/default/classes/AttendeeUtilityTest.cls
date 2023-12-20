public class AttendeeUtilityTest {
	public static Id getAttendeeData()
    {
        Attendee__c AttendeeObj = new Attendee__c();
        AttendeeObj.Name = 'Test Attendee';
        AttendeeObj.email__c = 'udaychand.k@tcs.com';
        
        insert AttendeeObj;
        
        return AttendeeObj.id;
	}
}