public with sharing class Challenge1 {
    public Challenge1() {

    }
    public static void Add151Accounts(){
        List<Account> toInsert = new List<Account>();

        for(Integer i = 0; i < 151; i++){
            toInsert.add(new Account(name = 'UniqueAccount' + i));
        }

        Insert toInsert;
    }
}