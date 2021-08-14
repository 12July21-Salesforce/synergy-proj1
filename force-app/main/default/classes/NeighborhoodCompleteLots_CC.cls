public class NeighborhoodCompleteLots_CC {
    
    public String getImageName(){
        return 'house-images/SB-01.jpg';
    }
    
    
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