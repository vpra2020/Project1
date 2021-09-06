@isTest
public with sharing class MiningSiteTriggerTest {
    public MiningSiteTriggerTest() {

    }

    @TestSetup
    static void makeData(){
        List<MiningSite__c> mock_sites = new List<MiningSite__c>();

        for(Integer i = 0; i < 100; i++){
            MiningSite__c site = new MiningSite__c();

            site.EstimatedWorth__c = Math.abs(Math.random());

            site.Name = 'Site' + i;

            if(Math.mod(i, 2) == 0){
                site.Active__c = true;
            }else {
                site.Active__c = false;
            }

            mock_sites.add(site);
        }

        Insert mock_sites;

        AggregateResult result = [SELECT COUNT(Id) FROM MiningSite__c];

        System.assert((Integer)result.get('expr0') > 0, 'NOTHING WAS INSERTED');
    }

    @isTest
    public static void test_update_clamp(){

        List<MiningSite__c> existing = [SELECT EstimatedWorth__c FROM MiningSite__c];

        for(MiningSite__c site : existing){
            site.EstimatedWorth__c = -1;
        }

        Update existing;

        existing = [SELECT EstimatedWorth__c FROM MiningSite__c];

        Boolean hasNegative = false;
        for(MiningSite__c site : existing){
            if(site.EstimatedWorth__c < 0){
                hasNegative = true;
            }
        }

        if(hasNegative){
            System.assert(false, 'Has negative!!');
        }else{
            System.assert(true);
        }
    }

    @isTest
    public static void test_delete_active(){

        List<MiningSite__c> existing = [SELECT EstimatedWorth__c FROM MiningSite__c];

        try{
            Delete existing;
            System.assert(false, 'Should not be able to delete Active, some of which certainly were.');
        }
        catch(Exception e){
            System.assert(true, 'Caught exception from trying to delete an active site, as expected.');
        }

    }
}