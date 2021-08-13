@isTest
public with sharing class TestLotsShow {

    private static List<Lot__c> testLots;

    @TestSetup
    static void makeLots(){
        Integer numOfLots = 6;
        Id neighborhoodDefault = 'a005e000006223pAAA';
        for(Integer i = 0; i < numOfLots; i++){
            Lot__c lotToTest = new Lot__c(Name='Test '+i, Neighborhood__c=neighborhoodDefault);
            testLots.add(lotToTest);
        }
    }

    @isTest static void testLotShows(){
        Pagereference pageToTest = Page.LotsShow;

        ApexPages.StandardSetController sstd = new ApexPages.StandardSetController(testLots);
        LotShowExtension testExtension = new LotShowExtension(sstd);
        
        Test.startTest();
        insert testLots;
        Test.stopTest();
    }
}
