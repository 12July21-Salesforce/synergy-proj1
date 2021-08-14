public class NeighborhoodCompleteLots_CC {
    
    //This is a hard coded image that will be replaced with a field pulled from SOQL
    //after the formula field gets created.
    public String getImageName(){
        return 'house-images/SB-01.jpg';
    }
    
    
    //Loop through the existing neighborhood and lot data
    //Look for neghborhoods that have lots marked 'spec' and 'construction complete'
    //Add those results to the list and return for use in the vf page display
    public List<Neighborhood__c> getNeighborhoods() {
        
        List<Neighborhood__c> results = new List<Neighborhood__c>();
        for(Neighborhood__c hood : [SELECT Name, Status__c, City__c, State__c, Zip_Code__c,
                                    	(SELECT Name, Home_Type__c, Status__c FROM Lots__r 
                                     	 WHERE Home_Type__c = 'Spec' AND Status__c = 'Construction Complete') 
                                    FROM Neighborhood__c
                                    //WHERE Status__c = 'Completed' 
                                    ORDER BY Name ASC]){
                                        
             for(Lot__c lot : hood.Lots__r){
                 if(lot.Home_Type__c == 'Spec' && lot.Status__c == 'Construction Complete'){
                     results.add(hood);
                 }                           
             }
                                        
            
            //results.add(hood);       
        }
        
        return results;
        
    } 
    
}