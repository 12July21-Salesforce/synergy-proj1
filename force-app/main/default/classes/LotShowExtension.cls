public with sharing class LotShowExtension {
    
    private final Lot__c lot;
    private List<String> statuses;

    public LotShowExtension(ApexPages.StandardSetController stdController) {
        lot = (Lot__c) stdController.getRecord();
        statuses = new List<String> {'Developed', 'Construction Complete', 'Under Construction'};
    }

    public void setStatusesShown(){
        //method to set the list of string for statuses
        //allows users to specify what kinds of lots to show
    }

    public List<Lot__c> purchasableLots{
        get{
            if(purchasableLots == null){
                purchasableLots = [SELECT Id, Name, Status__c, Address__c, State__c, Home_Type__c 
                                    FROM Lot__c 
                                    WHERE Status__c IN :statuses];
            }
            return purchasableLots;
        }
        private set;
    }
}
