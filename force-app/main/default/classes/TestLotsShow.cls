@isTest
public with sharing class TestLotsShow {

    private static List<Lot__c> testLots;

    @TestSetup
    static void makeLots(){
        testLots = new List<Lot__c>();
        Integer numOfLots = 6;
        Id neighborhoodDefault = 'a005e000006223pAAA';
        List<String> statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
        for(Integer i = 0; i < numOfLots; i++){
            Lot__c lotToTest = new Lot__c(Name='Test '+i, Neighborhood__c=neighborhoodDefault, Status__c=statuses.get(Math.Mod(i, 2)));
            testLots.add(lotToTest);
        }
    }

    @isTest static void testLotShows(){
        makeLots();
        Pagereference pageToTest = Page.LotsShow;

        ApexPages.StandardSetController sstd = new ApexPages.StandardSetController(testLots);
        LotShowExtension testExtension = new LotShowExtension(sstd);
        
        Test.startTest();

        insert testLots;
        Test.setCurrentPage(pageToTest);

        System.assert(testExtension.purchasableLots != null);
        System.assert(testExtension.resultSize > 0);
        testExtension.resultSizeNull();
        System.assert(testExtension.resultSize > 0);
        Test.stopTest();
    }
}
