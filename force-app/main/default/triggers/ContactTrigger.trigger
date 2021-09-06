trigger ContactTrigger on Contact (before insert) {

    switch on (Trigger.operationType) {
        
        when  BEFORE_INSERT{
            ContactInsertValidationLogic.validatePhones(Trigger.new);
        }

        // when else {
            
        // }
    }

}