public with sharing class CreateRealtor_CC {
    public Realtor__c realtor {
        get {
            if (realtor == null) {
                realtor = new Realtor__c();
            }
            return realtor;
        }
        set;
    }

    public PageReference saveRealtor() {
        Database.upsert(realtor);
        return Page.RealtorCreatedPage;
    }
}
