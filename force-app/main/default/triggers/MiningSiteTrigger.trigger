trigger MiningSiteTrigger on MiningSite__c (before delete, before update) {

    switch on (Trigger.operationType) {

        when BEFORE_UPDATE {
            MiningSiteUpdateLogic.clampEstWorth(Trigger.new);
        }

        when BEFORE_DELETE{
            MiningSiteDeleteLogic.preventDeleteActive(Trigger.old);
        }

    }
}