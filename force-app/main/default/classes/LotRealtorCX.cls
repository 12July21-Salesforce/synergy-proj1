<<<<<<< HEAD
public with sharing class LotRealtorCX {

    private Lot__c baseLot;

    public LotRealtorCX(ApexPages.StandardController stdController){
        baseLot = (Lot__c)stdController.getRecord();
=======
public class LotRealtorCX {

    public Lot__c baseLot{get; private set;}

    public LotRealtorCX(ApexPages.StandardController stdController){
        baseLot = [SELECT Id, Customer__r.Realtor__r.Realtor_Agency__c FROM Lot__c WHERE Id = :stdController.getId() LIMIT 1];
>>>>>>> joey
    }
    
    public List<Lot__c> agencyLots{
        get{
            if(agencyLots == null){
<<<<<<< HEAD
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name//, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__r.Realtor__r.Realtor_Agency__c = :baseLot.Customer__r.Realtor__r.Realtor_Agency__c]);
=======
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name, Customer__r.Realtor__r.Realtor_Agency__c
                                                FROM Lot__c
                                                WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :baseLot.Customer__r.Realtor__r.Realtor_Agency__c]);
>>>>>>> joey
            }
            return agencyLots;
        }
        private set;
    }
}