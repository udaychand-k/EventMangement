public class MyEmail{
    
    public static List<String> toAddresses = new List<String>();
    public static List<Messaging.SingleEmailMessage> emailListToSend = new List<Messaging.SingleEmailMessage>();
    
    public  boolean sendEmail(){
        try{
            draftEmail();
            List<Messaging.sendEmailResult> emailResults = Messaging.sendEmail(emailListToSend);
            
            for(Messaging.sendEmailResult emailResult: emailResults)
            {
                if(!emailResult.isSuccess()){
                    
                    List<Messaging.SendEmailError> errorsList = emailResult.getErrors();
                    
                    for(Messaging.SendEmailError err : errorsList)
                    {
                        System.debug('errors in while sending email are' + err);
                    }
                    
                }
                else{
                    System.debug('Mail sent Successfully.');
                }
            }
            return true;
        }
        catch(Exception e)
        {
            System.debug('*Exception Occured*'+e);
            return false;
        }
    }
    
    private void draftEmail()
    {
        Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
        
        String toAddress1 = 'udaychand.k@tcs.com';
        String toAddress2 = 'udaychand.kuppala@gmail.com';
        
        String subject = 'Batch Job completed Successfully :)';
        String htmlBody = 'Dear user, <br/> your batch process has completed successfully.<br/> Thanks & Regards,<br/> Udaychand K.';
        
        toAddresses.add(toAddress1);
        toAddresses.add(toAddress2);
        
        emailObj.setToAddresses(toAddresses);
        emailObj.setSubject(subject);
        emailObj.setHtmlBody(htmlBody);
        
        emailListToSend.add(emailObj);
        
        
    }
    
    
}