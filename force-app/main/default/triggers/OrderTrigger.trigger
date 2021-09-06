trigger OrderTrigger on Order (after update) { // can still use both old and new as readonly after update?

    switch on (Trigger.operationType) {
        
        when  AFTER_UPDATE{
            OrderUpdateMiningSite.ChangedActive(Trigger.old, Trigger.new);
        }

    }
}