public class ErrorLog {
    
    public static void logException(System.Exception exceptionObj, String exceptionOccuredMethodName)
    {
        Error_Log__c exceptionLog = new Error_Log__c(
            
            Log_Details__c	= exceptionObj.getStackTraceString()+'<br/> <strong> Exception Message is:<strong/>'+
            exceptionObj.getMessage()+'Exception type is:'+exceptionObj.getTypeName()+'occured at Line Number'+
            exceptionObj.getLineNumber()+'Cause is:'+exceptionObj.getCause()
            ,
            Log_stamp__c = System.now(),
            Process_Name__c = exceptionOccuredMethodName
        );   
        
        insert exceptionLog;
    }
    
    public static void logError(String error, String errorOccuredMethodName)
    {
        Error_Log__c errLog = new Error_Log__c(
            
            Log_Details__c	= error,
            Log_stamp__c = System.now(),
            Process_Name__c = errorOccuredMethodName
        );
        insert errLog;
    }
    
}