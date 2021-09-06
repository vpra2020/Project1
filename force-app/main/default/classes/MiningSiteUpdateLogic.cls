public with sharing class MiningSiteUpdateLogic {

    public static void clampEstWorth(List<MiningSite__c> listNew){ // assuming passed by reference of course, no way by value right?
        for(Integer i = 0; i < listNew.size(); i++){
            if (listNew[i].EstimatedWorth__c <= 0){
                listNew[i].EstimatedWorth__c = 0;
            }
        }
    }

}