public class OrganizerUtilityTest {
    
    public static ID getOrganizerData()
    {
        Event_Organizer__C organizerObj = new Event_Organizer__c();
        
        organizerObj.Name='Test Organizer';
        organizerObj.Address__c=AddressUtilityTest.getAddressData();
        organizerObj.email__c='udaychand141@gmail.com';
        return organizerObj.Id;
        
    }

}