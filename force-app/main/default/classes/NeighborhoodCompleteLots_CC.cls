public class NeighborhoodCompleteLots_CC {
        
    public List<NeighborhoodWrapper> hoodList {
        get {
            if(hoodList == null){
                hoodList = new List<NeighborhoodWrapper>();
                String imagePath = '';
                for(Neighborhood__c hood : [SELECT Name, Status__c, City__c, State__c, Zip_Code__c,
                                    (SELECT Name, Home_Type__c FROM Lots__r ) FROM Neighborhood__c]){
                    
                    
                    for(Lot__c lot : hood.Lots__r){
                        imagePath = 'house-images/' + lot.Name + '.jpg';
                        hoodList.add(new NeighborhoodWrapper(hood, lot, imagePath));                     
                    }                                                     
            }
               
        }
             return hoodList;
           
    }
        set;
        
    }
    
    public class NeighborhoodWrapper{
        public Neighborhood__c hood {get; set;}
        public Lot__c lot {get; set;}
        public String imageNumber {get; set;}
        
        public NeighborhoodWrapper(Neighborhood__c h, Lot__c l, String i){
            this.hood = h;
            this.lot = l;
            this.imageNumber = i;
            
        }
    }
    
}