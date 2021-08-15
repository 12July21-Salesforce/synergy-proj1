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
        
        

        
        
	




    
    


}