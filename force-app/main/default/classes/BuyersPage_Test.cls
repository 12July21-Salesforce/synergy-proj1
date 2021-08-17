@isTest
public class BuyersPage_Test {


    private static List<Customer__c> testCustomers;
    private static List<Lot__c> testLots;


    @TestSetup
    static void makeData(){
        Customer__c c1 = new List<Customer__c>();
        Lot__c l1 = new List<Lot__c>();

        c1.Status__c = 'BUYER';
        c1.Name = 'Mark Jones';
        c1.Buy_Date__c = Today();
        testCustomers.add(c1);
        l1.Name = 'CS=1';
        l1.Status__c = 'COMPLETED';
        l1.Customer__c = testCustomers[0];
        testLot.add(l1);
        
    }
    @isTest
    static void objectReturned() {

        makeData();

        PageReference testPage = Page.BuyersPage__c;
        BuyersPage_CC testCC = new BuyersPage_CC();

        Test.startTest();
        insert testCustomers;
        insert testLots;

        System.assert(testCC.buyers != null);  
    
        Test.stopTest();
    }

}




