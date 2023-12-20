public class AddressUtilityTest {
    
    public static Id getAddressData()
    {
        Location_Address__c addressObj = new Location_Address__c();
        
        addressObj.Name= 'Test Balaji Street';
        addressObj.City__c='Test ongole';
        addressObj.Country__c='India';
        addressObj.Verified__c = true;
        addressObj.State__c = 'Test Andhra pradesh';
        addressObj.Postal_Code__c = '123456';
        
            
        return addressObj.Id;
	}

}