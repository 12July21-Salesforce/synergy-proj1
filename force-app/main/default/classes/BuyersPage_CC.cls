public with sharing class BuyersPage_CC {

    public String searchText {get;set;}
    
    public List<Lot__c> buyers {get;set;}

    // public List<Lot__c> buyers {
    //     get{
    //         if(buyers == null){
    //             Date searchDate = Date.Today() - integer.valueof(searchText);
    //             buyers = new List<Lot__c>();
    //         for(Lot__c buy: [SELECT Neighborhood__c, Name, Status__c, Customer__c, Customer__r.Status__c, Customer__r.Buy_Date__c FROM Lot__c 
    //         WHERE Customer__r.Status__c = 'BUYER' AND Customer__r.Buy_Date__c < :searchDate ]){
    //             buyers.add(buy);
    //         }
    //     }
    //         return buyers;
    //     }
    //     set;
    // }


    public BuyersPage_CC() {
        
    }

    public void search(){
        Date searchDate = Date.Today() - integer.valueof(searchText);
        for(list<Lot__c> b :[SELECT Neighborhood__c, Name, Status__c, Customer__c, Customer__r.Status__c, Customer__r.Buy_Date__c FROM Lot__c 
                 WHERE Customer__r.Status__c = 'BUYER' AND Customer__r.Buy_Date__c < :searchDate]){
                     buyers = b;
                 }
    }


}