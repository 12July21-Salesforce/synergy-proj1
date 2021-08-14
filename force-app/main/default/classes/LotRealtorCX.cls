public with sharing class LotRealtorCX {

    private final Realtor__c baseRealtor;

     public LotRealtorCX(ApexPages.StandardController stdController){
         baseRealtor = stdController.getRecord();
     }

     public List<Lot__c> friendLots{
        get{
            if(friendLots == null){
                friendLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__r.Realtor__r.Realtor_Agency__c = :baseRealtor.Realtor_Agency__c]);
            }
            return friendLots;
        }
        private set;
     }
}