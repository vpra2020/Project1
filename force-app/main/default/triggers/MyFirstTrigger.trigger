//switch(Trigger.operationType)


trigger MyFirstTrigger on Contact (before insert) { // Challenge 7

    Set<String> existingEmails = new Set<String>();
    
    List<Contact> existingContacts = [SELECT Email FROM Contact];
    
    for(Contact con : existingContacts){
        existingEmails.add(con.Email);
    }
    
    for(Contact con : Trigger.new){
        if (existingEmails.contains(con.Email))
            con.addError('Contact with this email already exists.!!');
    }

    System.debug('Trigger.new is this big ' + Trigger.new.size());

}