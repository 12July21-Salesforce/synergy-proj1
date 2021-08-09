public with sharing class CustomerRealtor_CX {

    private final List<Customer__c> customers;

    public CustomerRealtor_CX(ApexPages.StandardSetController stdSetController) {
        this.customers = (List<Customer__c>) stdSetController.getRecords();
    }

    public PageReference createRealtor() {
        return  Page.RealtorCreationPage;
    }
}
