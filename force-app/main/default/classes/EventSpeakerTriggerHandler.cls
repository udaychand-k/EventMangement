public class EventSpeakerTriggerHandler {
    private static  Set<Id> currentEventId = new Set<Id>();
    private static Set<Id> currentSpeakerId = new Set<Id>();
    private static Map<Id,list<Datetime>> existingSpeakerEventsIdAndStartEndTimeMap = new Map<Id,list<DateTime>>();
    
    public static boolean checkConflict(List<Event_Speaker__c> currentEventAndSpeaker)
    {
        setCurrentEventAndSpeakerIds(currentEventAndSpeaker[0]);
        
        setExistingSpeakerEventsIdAndStartEndTimeMap(getExistingSpeakerEvents());
        
        list<list<Datetime>> existingStartEndTimes = existingSpeakerEventsIdAndStartEndTimeMap.values();
        
        return compareEvents(getCurrentEvent(),existingStartEndTimes);
    }
    
    private static void setCurrentEventAndSpeakerIds(Event_Speaker__c currentEventAndSpeaker)
    {
                currentEventId.add(currentEventAndSpeaker.Event__c);
                currentSpeakerId.add(currentEventAndSpeaker.Speaker__c);
        }
    
    private static void setExistingSpeakerEventsIdAndStartEndTimeMap(List<Event_Speaker__c> allSpeakerEvents)
    {
        for(Event_Speaker__c eachEvent : allSpeakerEvents)
        {
            list<Datetime> eachEventStartEndTime = new list<Datetime>();
            
            eachEventStartEndTime.add(eachEvent.Event__r.Start__c);
            eachEventStartEndTime.add(eachEvent.Event__r.End__c);
            
            existingSpeakerEventsIdAndStartEndTimeMap.put(eachEvent.id,eachEventStartEndTime);
        }
    }
    
    private static Event__c getCurrentEvent()
    {
        return  [select id,Start__c,End__c from Event__c where id In :currentEventId ][0];
    }
    
    private static  List<Event_Speaker__c> getExistingSpeakerEvents()
    {
        return [select Event__r.Start__c , Event__r.End__c, id from Event_Speaker__c where Speaker__r.id IN :currentSpeakerId];
        
    }
    
    private static boolean compareEvents( Event__c currentEvent,list<list<Datetime>> existingStartEndTimes)
    {
        boolean flag=false;
        
        for(list<Datetime> eachStartEndTime : existingStartEndTimes)
        {
            if (!(currentEvent.Start__c >=eachStartEndTime[1] || currentEvent.End__c <= eachStartEndTime[0]))
            {
                flag=true;
                //Means that, there is conflict;
                return flag;
            }
        }
        
        return flag;
    }
    
    
}