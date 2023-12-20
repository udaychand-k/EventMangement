public class EventAttendeeTriggerHandler {
    
    private static List<Messaging.SingleEmailMessage>  emailList = new List<Messaging.SingleEmailMessage>();
    
    public static void sendConfirmationEmail(Map<Id,Event_Attendee__c> attendees)
    {
        
        draftEmails(attendees);
        system.debug(emailList);
        
        
        try
        {
            List<Messaging.SendEmailResult> emailResult = Messaging.sendEmail(emailList);
            system.debug('******'+emailResult);
            for(Messaging.SendEmailResult eachSendEmailResult : emailResult)
            {
                if(eachSendEmailResult.isSuccess())
                      System.debug('The email was sent successfully.');
                else
                {
                    
                    List<Messaging.SendEmailError> errors = eachSendEmailResult.getErrors();
                    ErrorLog.logError(JSON.serialize(errors),'EventAttendeeTriggerHandler');
                }
            }
            
        }
        catch(Exception exceptionObj)
        {
            ErrorLOg.logException(exceptionObj, 'EventAttendeeTriggerHandler');
        }
    }
    
    private static void draftEmails(Map<Id,Event_Attendee__c> attendees)
    {
        
        for(ID eachAttendee: attendees.keySet())
        {
            List<String> eventDetails = new List<string>();
            
            Event_Attendee__c eAttendee = attendees.get(eachAttendee);
            Attendee__c attendDetail = getAttendeeDetails(eAttendee.Attendee__c);
            Event__c eventDetail = getEventDetails(eAttendee.Event__c);
            
        
            
            eventDetails.add(attendDetail.Name);
            
            eventDetails.add(eventDetail.Name__c);
            eventDetails.add(String.valueOf(eventDetail.Start__c));
            eventDetails.add(eventDetail.Address__r.City__c);
            eventDetails.add(eventDetail.Organizer__r.Name);
            
            
            Messaging.SingleEmailMessage emailMessage =new Messaging.SingleEmailMessage();       
            
            emailMessage.setSubject('Entry Pass for the '+ eventDetail.Name__c );
            emailMessage.setSenderDisplayName(eventDetail.Organizer__r.Name);
            
            List<String> toAddress= new List<String>();
            toAddress.add(attendDetail.email__c);
            emailMessage.setToAddresses(toAddress);
            System.debug(toAddress);
            string emailBody = String.format('Dear {0}, </br> Thank you for registering for {1} which will be organized on {2} & will be held in {3}. We are excited to have you, see you in the event.</br>Find the Google Map Location for the event Here. (https://www.google.com/maps/place/{3})  </br>Thanks & Regards,   </br>   {4}       ',eventDetails);
            emailMessage.setHtmlBody(emailBody);
            emailList.add(emailMessage);
            
        }
        
    }
    
    private static Event__c getEventDetails(Id Event)
    {
        Event__c eventDetails = [select Name__c,Start__c,Address__r.City__c,Organizer__r.Name from Event__c where Id = :Event ];
        return eventDetails;
	}
    private static Attendee__c getAttendeeDetails(ID attendee)
    {
        Attendee__c attendDetails = [select Name,email__c,Phone_Number__c,Company_Name__c from Attendee__c where Id= :attendee][0];
        
        return attendDetails;
    }
    
}