public with sharing class LotRealtorCX {

    private final Realtor__c baseRealtor;

     public LotRealtorCX(ApexPages.StandardController stdController){
         baseRealtor = (Realtor__c)stdController.getRecord();
     }

     public List<Lot__c> agencyLots{
        get{
            if(agencyLots == null){
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__r.Realtor__r.Realtor_Agency__c = :baseRealtor.Realtor_Agency__c]);
            }
            return agencyLots;
        }
        private set;
     }
}