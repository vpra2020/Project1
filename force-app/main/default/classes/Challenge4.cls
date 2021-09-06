public with sharing class Challenge4 {
    public Challenge4() {

    }

    public static void MapDefaultContacts(){

        List<Account> myAccounts = [SELECT name, (SELECT FirstName, LastName, Phone, Email FROM Contacts) FROM Account];

        Map<Account, List<Contact>> myMap = new Map<Account,List<Contact>>();

        for (Integer i = 0; i < myAccounts.size(); i++){
            
            for(Contact contact : myAccounts[i].Contacts){
                if (contact.Phone == '7078887890' || contact.Email == 'defaultemail@gmail.com'){
                    myMap.put(myAccounts[i], myAccounts[i].Contacts);
                    break;
                }
            }
        }


        // Challenge 5 too
        
        List<SObject> toUpdate = new List<SObject>();

        for(Account acc : myMap.keySet()){ // for all accounts with default infos
            toUpdate.add(acc);

            String newFirstName;
            String newLastName;

            if (acc.Name.containsWhitespace()){
                List<String> names = acc.Name.split(' ');
                newFirstName = names[0];
                newLastName = names[1];
            }
            else{
                newFirstName = acc.Name;
                newLastName = acc.Name;
            }

            String newAccName = '';
            for(Contact contact : myMap.get(acc)){ // for each contact in that account
                toUpdate.add(contact);

                if (! (newAccName.contains(contact.FirstName) && newAccName.contains(contact.LastName))){
                    newAccName += contact.FirstName + ' ' + contact.LastName + ' ';
                }

                contact.FirstName = newFirstName;
                contact.LastName = newLastName;
            }

            acc.Name = newAccName;

        }

        Update toUpdate;

    }
}