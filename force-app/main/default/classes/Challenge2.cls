public with sharing class Challenge2 {
    public Challenge2() {

    }

    public static void RemoveChally1Accounts(){
        List<Account> toDelete = [SELECT name FROM Account WHERE name LIKE 'UniqueAccount%'];

        Delete toDelete;
    }
}