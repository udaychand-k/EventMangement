public class LocationTriggerHandler {
    
     
    public static boolean x=false;
    
    @future(callout=true)
   public static void callout(ID locRecordId){
       String endpoint = 'https://us-street.api.smartystreets.com/street-address?auth-id=58382020-ef1f-1719-1421-1b69b58f8d85&auth-token=iUVAdge9nVmtuiw2EBjY&license=us-core-cloud';
        Http httpConnection = new Http();
        
        
        HttpRequest req = new HttpRequest();
        
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Host', 'us-street.api.smartystreets.com');
        req.setMethod('GET');
        String queryParameters = '';
        
        Location_Address__c locObj =  [Select Id,Landmark__c,Name,City__c,Verified__c,Country__c,State__c,Postal_Code__c from Location_Address__c where Id = :locRecordId][0];
        
        System.debug(locObj);
        
        queryParameters += '&street='+EncodingUtil.urlEncode(locObj.Name, 'UTF-8')+'&city='+EncodingUtil.urlEncode(locObj.City__c, 'UTF-8') +'&state='+EncodingUtil.urlEncode(locObj.State__c, 'UTF-8')+'&candidates=10';
        
        req.setEndpoint(endpoint+queryParameters);
        

        
        HttpResponse resp = httpConnection.send(req);
        
        if(resp.getStatusCode()==200)
        {
            locObj.Verified__c=true;
            update locObj;
            System.debug('&&&& ' + resp.getBody());
            Location_Address__c loctionDeserializeObj = (Location_Address__c) JSON.deserialize(resp.getBody(), Location_Address__c.class);
            System.debug(loctionDeserializeObj);
          
         }
    }
    public static void validateAddress(Map<Id,sObject> locationObj){
        
        Id locRecordId = new List<Id>(locationObj.keySet())[0];
        System.debug(locRecordId);
        
        callout(locRecordId);
    }
    
    
   
}