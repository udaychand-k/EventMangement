@isTest
public class TwoMonthsEventsDeletionBatchTest {

    @testSetup
    public static void commonProvisionalData(){
        
        List<Event__c> events = new List<Event__c>();
        for(Integer i =1 ; i<=20000; i++)
        {
            Event__c event = new Event__c();
            
            event.Start__c = Datetime.newInstance(2023, 1, 1, 1, 1, 1);
            event.End__c = Datetime.newInstance(2023, 3, 1, 1, 1, 1);
            
		}
        insert events;
    }
    
    @isTest static void TwoMonthsEventsDeletionBatchTestMethod()
    {
        Database.executeBatch(new TwoMonthsEventsDeletionBatch());
    }
}