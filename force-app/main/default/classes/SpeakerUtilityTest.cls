public class SpeakerUtilityTest {
    
    public static Id getSpeakerData()
    {
        Speaker__c speakerObj = new Speaker__c();
        
        speakerObj.Name='Test Speaker';
        
        insert speakerObj;
        
        return speakerObj.Id;
	}

}