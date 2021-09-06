public with sharing class MiningSiteDeleteLogic {

    public static void preventDeleteActive(List<MiningSite__c> listOld){
        for(MiningSite__c site : listOld){
            if (site.Active__c){
                site.addError('Cannot delete Active Mining Site.');
            }
        }
    }

}