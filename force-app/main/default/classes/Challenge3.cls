public with sharing class Challenge3 {
    public Challenge3() {

    }

    public static void SetDefaultInfo(){
        List<Contact> toUpdate = [SELECT phone,email FROM Contact WHERE Email = null OR Phone = null]; // SELECT name?? Does the query just return the whole record instance anyway though?

        for(Contact contact : toUpdate){

            if (contact.Phone == null){
                contact.Phone = '7078887890';
            }
            if (contact.Email == null){
                contact.Email = 'defaultemail@gmail.com';
            }
        }
        Update toUpdate;

        


    }
}