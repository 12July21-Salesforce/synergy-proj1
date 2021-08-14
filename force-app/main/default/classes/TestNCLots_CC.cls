@isTest
public class TestNCLots_CC {
    
    @isTest
    (SeeAllData=true) public static void TestNeighborhoodCompleteLots_CC(){ 
        
        NeighborhoodCompleteLots_CC controller = new NeighborhoodCompleteLots_CC();
        List<Neighborhood__c> neighborhoods = controller.getNeighborhoods();
        List<Lot__c> lots = [SELECT Status__c, Home_Type__c
                             FROM Lot__c
                             WHERE Status__c = 'Construction Complete' AND Home_Type__c = 'Spec'];
       Integer numOfLots = lots.size();
       
        System.assertEquals(numOfLots, neighborhoods.size());

    }

}