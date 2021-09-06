public with sharing class WorkingWithData {

    // SOQL
    // query data in org
    // use sObjects that exist in our org
    // get records that exist for our org

    public WorkingWithData() {

    }

    public static void Query(){
        // SOQL returns list of sObjects
        List<SObject> myResults = [SELECT name FROM Account];
        List<Account> accounts = myResults; // can also just set myResults to a List<Account> in the first place
        System.debug(accounts[0].Name);

        // SOQL clauses
        // -LIMIT X : Limit how many records are returned by a query, literally just gets the first X amount
        // -OFFSET X : starts returning records after the first X records
        // used in combination to perform 'pagination'

        // SELECT name FROM Account WHERE name IN :namesToFilter
        // SELECT name FROM Account WHERE name LIKE '%a%a%'
        // can use NOT, OR, AND with WHERE for example

        Set<String> filteredNames = new Set<String>();

        // - FIELDS()
            // -ALL, STANDARD, CUSTOM
            // this will respect field level security
        // can mix with example
        // SELECT name, FIELDS(CUSTOM) FROM Account LIMIT 200

        // -FORMAT()
        //      - Format number, date, time, currency fields

        //- FOR
        //  - VIEW : update the Last Viewed Date field on records
        //  - REFERENCE : updates Last Referenced Date field on records
        //  - UPDATE : Locks record from being updated by anyone except the locker until the transaction ends
        // ex. SELECT name FROM Account FOR VIEW

        // ORDER BY fieldname/alias


    }

    public static void AggregateFunctions(){
        // when you use an aggregate function, return type is of AggregateResult, clearly not records lol
        // still able to use .get()
        // use an alias to reference fields, otherwise name of fields is expr# starting with 0
        //
        // -AVG(), COUNT(), MIN(), MAX(), SUM(), COUNT_DISTINCT()
        // AggregateFunctions ignore average null fields, so for example the count will not include the nulls, and the average will not divide by the total number of records if nulls
        // 
        // - GROUP BY  ,  works if you group by a field that is not unique among a number of records, it'll batch them together
        //
        // alias such as  : SELECT COUNT(id) accountNum FROM Account     aliases what would otherwise by expr0 or something to use in .get()

        // HAVING is a clause/keyword just like WHERE but for use with GROUP BY

    }

    public static void DateFunctions(){
        // -CALENDAR_YEAR(), CALENDAR_QUARTER(), DAY_IN_MONTH(), DAY_IN_WEEK(), DAY_IN_YEAR(), DAY_ONLY(), FISCAL_MONTH(), FISCAL_QUARTER(), FISCAL_YEAR()
        // HOUR_IN_DAY(), WEEK_IN_MONTH(), WEEK_IN_YEAR()

    }

    public static void RelationshipQueries(){
        // allowed to query for information in parent or child objects of a record
        // Parent to Child : Accounts -> Contacts
        // looks like : SELECT name, (SELECT name FROM Contacts) FROM Account
        // then you can for loop over the returned field you subqueried, which IS A LIST of the related records, queried appropriately

        // Child to Parent : Contacts -> Accounts
        // SELECT name, Account.name FROM Contact
    }

    public static void DML(){
        // Data Manipulation Language
        // allows us to persist changes to the database

        // INSERT
        // UPDATE
        // DELETE
        // MERGE
        // UPSERT , inserts if doens't exist, updates if it does

        //Account myNewAccount = new Account(Name = 'My Apex Account', Rating = 'Hot', AnnualRevenue = 1500000);

        //Insert myNewAccount;

        //List<Account> toDelete = [SELECT name FROM Account WHERE name = 'My Apex Account'];

        //Delete toDelete;

        Account toUpdate = [SELECT name, rating, Active__c FROM Account WHERE name = 'My Apex Account'];

        toUpdate.Active__c = 'Yes';

        Update toUpdate;

        List<Contact> myContactList = new List<Contact>();

        myContactList.add(new Contact(lastName = 'Valid Contact'));
        myContactList.add(new Contact(firstName = 'invalid contact'));

        Database.Insert(myContactList); // "ALL OR NOTHING" ideology, if one exception rises then do not insert any of them
        // if you do not want all or nothing, you can specify false as the second paremeter to Insert as above, allows partial insertion by setting all or nothing to false

    
    
    }

    public static void GovernorLimits(){
        for (Integer i = 0; i < 152; i++){
            Insert new Contact(lastName = 'This will fail!');
        }

        // exceeding governor limits (in this case the number of transactions or what you call this) will cause all changes in that transaction/whatever to be reverted and not applied at all
    

        // so instead of doing a loop of inserts, do a loop of record creations/whatever into a List and then Insert the list in a single operation

        // for whatever : List<Contact>.add contacts as many as you want! xD
        //Insert contactList;
        // keep DML outside of loops



        // SOQL Queries also have governor limits
        // We should map together records that need to be accessed together to save on query limits

        //i.e.

        List<Account> myAccounts = [SELECT name, (SELECT name FROM Contacts) FROM Account];

        Map<Account, List<Contact>> myMap = new Map<Account,List<Contact>>();

        Integer lastPosition = myAccounts.size() - 1;

        for (Integer i = 0; i < myAccounts.size(); i++){
            myMap.put(myAccounts[0], myAccounts[lastPosition - i].Contacts); // wtf did we do this for lol? makes no sense.
        }

    
    }


    public static void TCL(){
        // Transaction Control Language

        // set savepoints
        //rollback to savepoints

        Savepoint sp1 = Database.SetSavepoint();
        // perform some DML


        Database.Rollback(sp1); // does not revert ID's
        // will discard any DML that occurs after the savepoint
        // rolling back to savepoint does not reset governor limits
        // cannot roll'forward' to a savepoint if you've rolled back to one even before it already

        // setting a savepoint counts as a DML operation


    }

}