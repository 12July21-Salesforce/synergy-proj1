public with sharing class LotRealtorCX {

    private Lot__c baseLot;

    public LotRealtorCX(ApexPages.StandardController stdController){
        baseLot = (Lot__c)stdController.getRecord();
    }
    
    public List<Lot__c> agencyLots{
        get{
            if(agencyLots == null){
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name//, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__r.Realtor__r.Realtor_Agency__c = :baseLot.Customer__r.Realtor__r.Realtor_Agency__c]);
            }
            return agencyLots;
        }
        private set;
    }
}