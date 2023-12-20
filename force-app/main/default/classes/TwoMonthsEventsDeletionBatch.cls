public class TwoMonthsEventsDeletionBatch implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext batchableObj){
        
        String queryToDelete = 'Select Id,Name__c from Event__c where End__c < LAST_N_MONTHS:2 AND Live__c = true';
        
        return Database.getQueryLocator(queryToDelete);
    }
    
    public void execute(Database.BatchableContext batchableObj, List<sObject> records){
        
        if(!records.isEmpty())
        {
            List<Database.DeleteResult> deleteResults = Database.delete(records);
            
            for(Database.DeleteResult deleteResult : deleteResults)
            {
                if(!deleteResult.isSuccess()){
                    
                    List<Database.Error> errors = deleteResult.getErrors();
                    
                    String error = String.join(errors,',');
                   
                    ErrorLog.logError(error,'TwoMonthsEventsDeletionBatch execute method');
										
                }
			}
        }
        
    }
    
    public void finish(Database.BatchableContext batchableObj){
        MyEmail myEmailObj = new MyEmail();
        myEmailObj.sendEmail();
      
    }
}