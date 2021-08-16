<<<<<<< HEAD
@isTest
public class TestNCLots_CC {
        
    @isTest
    static void positiveTest(){
        

        
        List<Neighborhood__c> testhoods = new List<Neighborhood__c>();
        
        Neighborhood__c tn = new Neighborhood__c();
        tn.Name = 'Misterogers';
        tn.Status__c = 'Completed';
        testhoods.add(tn);
           
        List<Lot__c> testLots = new List<Lot__c>();
        Lot__c tl = new Lot__c();
        tl.Name = 'TL-01';
        tl.Home_Type__c = 'Spec';
        tl.Status__c = 'Construction Complete';
        tl.Neighborhood__c = tn.Id;
        testLots.add(tl);
        
        insert testhoods;
                       
		PageReference testPage = Page.NeighborhoodCompleteLots;
        testPage.getParameters().put('id', tn.Id);
        Test.setCurrentPage(testPage);
        
        String imagePath = 'testString';
        
        NeighborhoodCompleteLots_CC testController = new NeighborhoodCompleteLots_CC();
        NeighborhoodCompleteLots_CC.NeighborhoodWrapper testWrapper = 
            new NeighborhoodCompleteLots_CC.NeighborhoodWrapper(tn, tl, imagePath);
        
        List<NeighborhoodCompleteLots_CC.NeighborhoodWrapper> t = testController.neighborhoodList;
        Integer listSize = t.size();
        
        //System.assertEquals(1, listSize);
        

		
         
        

        
    }
        
        

        
        
	




    
    


=======
@isTest 
public class TestNCLots_CC { 
    
    private static List<Neighborhood__c> testhoods;
    private static List<Lot__c> testLots;
    
    @TestSetup
    static void makeData(){ 
        
        testhoods = new List<Neighborhood__c>(); 
        Neighborhood__c tn = new Neighborhood__c(); 
        tn.Name = 'Misterogers'; 
        tn.Status__c = 'Completed'; 
        testhoods.add(tn); 
        
        testLots = new List<Lot__c>(); 
        Lot__c tl = new Lot__c(); 
        tl.Name = 'TL-01'; 
        tl.Home_Type__c = 'Spec'; 
        tl.Status__c = 'Construction Complete'; 
        tl.Neighborhood__c = tn.Id; 
        testLots.add(tl); 
        
        
    }
    
    
    @isTest
    static void testData(){
        makeData();
        
        PageReference testPage = Page.NeighborhoodCompleteLots;
        
        NeighborhoodCompleteLots_CC testController = new NeighborhoodCompleteLots_CC();
        NeighborhoodCompleteLots_CC.NeighborhoodWrapper testWrapper;
        
        Test.startTest();
        insert testhoods; 
        
        //Id testId = testController.curId;
        
        String imagePath = 'testString';  
        testWrapper = new NeighborhoodCompleteLots_CC.NeighborhoodWrapper(testhoods.get(0), testlots.get(0), imagePath);
        
        Neighborhood__c testhood = testWrapper.neighborhood;
        Lot__c testlot = testWrapper.lot;
		String testimage = testWrapper.imagePath;
        
        Test.setCurrentPage(testPage);
        System.assert(testController.neighborhoodList != null);
        System.assert(testhood != null && testlot != null && testimage != null);
        
        Test.stopTest(); 
        
    }
          
    
   /*
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

    @isTest
    (SeeAllData=true) public static void negativeTest(){ 
       NeighborhoodCompleteLots_CC controller = new NeighborhoodCompleteLots_CC();
       List<Neighborhood__c> neighborhoods = controller.getNeighborhoods();
      
       System.assertNotEquals(null, neighborhoods.size());
       
   }

   */
>>>>>>> neighborhood-complete-lots
}