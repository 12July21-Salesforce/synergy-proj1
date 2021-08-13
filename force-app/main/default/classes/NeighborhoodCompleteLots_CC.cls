public class NeighborhoodCompleteLots_CC {

    public String getImageName(){
        return 'house-images/house1.jfif';
    }

    //Just trying to breakdown the process to solve the SOQL mystery
    public List<Neighborhood__c> getNeighborhoods() {
        
        List<Neighborhood__c> results = new List<Neighborhood__c>();
        for(Neighborhood__c hood : [SELECT Name, (SELECT Name FROM Lots__r ) FROM Neighborhood__c]){
            results.add(hood);       
        }
    
    return results;

} 
    
    /*
    public List<CompleteLotsWrapper> completeList {
        get {
            if(completeList == null){
                completeList = new List<CompleteLotsWrapper>();
                String testString ='testString';
                for(Neighborhood__c hood : [SELECT Name, (SELECT Name FROM Lots__r)
                                            FROM Neighborhood__c
                                            LIMIT 2]){
                    for(Lot__c lot : hood.Lots__r){
                        
                        //TODO: This is going to add neighborhood too many times
                        completeList.add(new CompleteLotsWrapper(hood, lot, testString)); 
                    }    
                }//end for 
            }//end if
            
            return completeList;
        }//end get
        
        set;

    }//end end

    */







public class CompleteLotsWrapper{
    
    public Neighborhood__c hood {get; set;}
    public Lot__c lot {get; set;}
    public String url {get; set;}
    
    public CompleteLotsWrapper(Neighborhood__c h, Lot__c l, String u){
        this.hood = h;
        this.lot = l;
        this.url = u;
    }

}




}
