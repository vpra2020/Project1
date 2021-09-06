public with sharing class ContactInsertValidationLogic {

    public static void validatePhones(List<Contact> listNew){

        List<Contact> existing = [SELECT phone, email FROM Contact];

        Set<String> phones = new Set<String>();
        Set<String> emails = new Set<String>();

        for(Contact con : existing){
            phones.add(con.Phone);
            emails.add(con.Email);
        }

        for(Integer i = 0; i < listNew.size(); i++){
            // check new contacts only against existing contacts in DB
            if(phones.contains(listNew[i].Phone) || emails.contains(listNew[i].Email)){
                listNew[i].addError('Phone or Email already taken by another Contact.');
                continue;
            }

            // check new contacts against other new contacts as well
            for(Integer j = 0; j < listNew.size(); j++){
                if (i != j){
                    if(listNew[j].Email == listNew[i].Email || listNew[j].Phone == listNew[i].Phone){
                        listNew[j].addError('Email or phone already taken by another Contact.');
                        listNew[i].addError('Email or phone already taken by another Contact.');
                    }
                }
            }
            
        }
        
    }

}