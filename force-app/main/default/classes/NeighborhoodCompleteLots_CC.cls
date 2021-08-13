public class NeighborhoodCompleteLots_CC {
    
    public String getImageName(){
        return 'house-images/SB-01.jpg';
    }
    
    //Just trying to breakdown the process to solve the SOQL mystery
    public List<Neighborhood__c> getNeighborhoods() {
        
        List<Neighborhood__c> results = new List<Neighborhood__c>();
        for(Neighborhood__c hood : [SELECT Name, Status__c, City__c, State__c, Zip_Code__c,
                                    (SELECT Name, Home_Type__c FROM Lots__r ) FROM Neighborhood__c]){
                                        
            
            results.add(hood);       
        }
        
        return results;
        
    } 
    
}