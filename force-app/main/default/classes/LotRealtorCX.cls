public class LotRealtorCX {

    public Lot__c baseLot{get; private set;}

    public LotRealtorCX(ApexPages.StandardController stdController){
        stdController.addFields(new String[]{'Customer__r.Realtor__r.Realtor_Agency__c'});
        baseLot = (Lot__c)stdController.getRecord();
    }
    
    public List<Lot__c> agencyLots{
        get{
            if(agencyLots == null){
                agencyLots = new List<Lot__c>([ SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name
                                                FROM Lot__c
                                                WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :baseLot.Customer__r.Realtor__r.Realtor_Agency__c]);
            }
            return agencyLots;
        }
        private set;
    }
}