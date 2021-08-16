@isTest
private class LotRealtor_Test {

    private static final String myPage = '/apex/LotRealtorPage/';

    private static String lotIdString;
    private static Lot__c myLot;

    private static Boolean allGood;
    private static LotRealtorCX myCX;
    
    private static List<Lot__c> gotList;
    private static List<Lot__c> truthList;

    @TestSetup
    private static void mainSetup(){
        BigTest.mainSetup();
    }

    @isTest
    private static void TestA(){

        Test.startTest();

        myLot = BigTest.test_lots[5];
        lotIdString = (String)myLot.Id;

        Test.setCurrentPage(new PageReference(myPage+lotIdString));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Name != 'Realtor A'){
                allGood = false;
                break;
            }
        }

        System.assert(truthList.size() == gotList.size() && allGood);

        Test.stopTest();
    }

    @isTest
    private static void TestB(){
        Test.startTest();

        myLot = BigTest.test_lots[14];
        lotIdString = (String)myLot.Id;

        Test.setCurrentPage(new PageReference(myPage+lotIdString));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Name != 'Realtor B'){
                allGood = false;
                break;
            }
        }

        System.assert(truthList.size() == gotList.size() && allGood);

        Test.stopTest();
    }

    @isTest
    private static void TestC(){
        Test.startTest();

        myLot = BigTest.test_lots[20];
        lotIdString = (String)myLot.Id;

        Test.setCurrentPage(new PageReference(myPage+lotIdString));
        myCX = new LotRealtorCX(new ApexPages.StandardController(myLot));

        allGood = true;
        gotList = myCX.agencyLots;

        truthList = [   SELECT Id, Name, Customer__r.Name, Customer__r.Realtor__r.Name
                        FROM Lot__c
                        WHERE Customer__c != NULL AND Customer__r.Realtor__r.Realtor_Agency__c = :myLot.Customer__r.Realtor__r.Realtor_Agency__c];

        for(Lot__c testLot: gotList){
            if(testLot.Customer__r.Realtor__r.Name != 'Realtor C'){
                allGood = false;
                break;
            }
        }

        System.assert(truthList.size() == gotList.size() && allGood);

        Test.stopTest();
    }
}
