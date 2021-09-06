public with sharing class OrderUpdateMiningSite {

    public static void ChangedActive(List<Order> listOld, List<Order> listNew){
        List<Order> changedActive = new List<Order>();

        for(Integer i = 0; i < listOld.size(); i++){
            if (listOld[i].Status == 'Draft' && listNew[i].Status == 'Activated'){
                changedActive.add(listNew[i]);
            }
        }
        updateFromActivated(changedActive);
    }

    private static void updateFromActivated(List<Order> activated){

        Map<Id, MiningSite__c> sites = new Map<Id, MiningSite__c>([SELECT Id, EstimatedWorth__c FROM MiningSite__c]); // Map has a constructor to automatically do this, as long as implicit conversion takes the list calls that constructor
                                                                                                                    // ok perhaps the implicit conv. didn't work, but it still should be constructed this way.
        List<MiningSite__c> sitesToUpdate = new List<MiningSite__c>();
        
        for(Order ord : activated){

            System.assert(sites.get(ord.MiningSite__c).EstimatedWorth__c > 0, 'Site has only 0 initial value!');

            sites.get(ord.MiningSite__c).EstimatedWorth__c -= ord.TotalAmount; // I take it that ord.MiningSite__c is the ID of the mining site

            System.assert(ord.TotalAmount > 0, 'Order total amount better be greater than 0 as configured for test');

            sitesToUpdate.add(sites.get(ord.MiningSite__c));
        }

        Update sitesToUpdate;
    }
}