@isTest
public with sharing class ContactTriggerTest {

    public ContactTriggerTest() {

    }

    @TestSetup
    public static void makeData(){

        // populate some mock data

        Insert loop_populate(0, 100);
    }

    private static List<Contact> loop_populate(Integer rangeStart, Integer rangeStop){

        List<Contact> toInsert = new List<Contact>();

        for(Integer i = rangeStart + 1000; i < rangeStop + 1000; i++){

            Contact con = new Contact();
            con.FirstName = 'first';
            con.LastName = 'last';
            con.Email = 'email' + i + '@email.com';
            con.Phone = '707-333-' + i;

            toInsert.add(con);
        }

        return toInsert;
    }

    @isTest
    public static void TS_ContactTrigger(){

        // TP Single

        Contact toInsert = new Contact();

        toInsert.FirstName = 'first'; // duplicate names should not throw
        toInsert.LastName = 'last';
        toInsert.Email = 'email' + 123 + '@email.com'; // this should be unique
        toInsert.Phone = '707-333-0123'; // this should be unique

        try{
            Insert toInsert;
            System.assert(true);
        }
        catch(Exception e){
            System.assert(false);
        }

        // TN Single

        toInsert = new Contact();

        toInsert.FirstName = 'first'; // duplicate names should not throw
        toInsert.LastName = 'last';
        toInsert.Email = 'email' + 1000 + '@email.com'; // this should NOT be unique
        toInsert.Phone = '707-333-1000'; // this should throw

        try{
            Insert toInsert;
            System.assert(false);
        }
        catch(Exception e){
            System.assert(true);
        }
    }

    @isTest
    public static void TB_ContactTrigger(){

        // TB Positive

        List<Contact> toInsert = new List<Contact>();

        toInsert = loop_populate(0, 100);
        
        try{
            Insert toInsert;
            System.assert(false, 'Contacts were all inserted, but the trigger should not have let this and thrown an exception.');
        }
        catch(Exception e){
            System.assert(true, 'Contacts were not properly inserted, as expected.');
        }


        // TB Neg

        toInsert = new List<Contact>();

        toInsert = loop_populate(100, 200);
        
        try{
            Insert toInsert;
            System.assert(true, 'Unique Contacts were all inserted!');
        }
        catch(Exception e){
            System.assert(false, 'Contacts SHOULD have been unique, and all been inserted, but they were not.');
        }
        
    }

    @isTest
    public static void TB_Overlap(){

        List<Contact> toInsert = new List<Contact>();

        toInsert = loop_populate(0, 200);
        
        try{
            Insert toInsert;
            System.assert(false, 'Contacts were all inserted, but the trigger should not have let this and thrown an exception at some point.');
        }
        catch(Exception e){
            System.assert(true, 'Not all Contacts were not properly inserted, as expected.');
        }
    }

    @isTest
    public static void TB_inserting_duplicates(){

        List<Contact> toInsert = new List<Contact>();

        toInsert = loop_populate(200, 250);
        toInsert.addAll(loop_populate(200, 250));
        
        try{
            Insert toInsert;
            System.assert(false, 'Contacts were all inserted, but the trigger should not have let this and thrown an exception at some point.');
        }
        catch(Exception e){
            System.assert(true, 'Not all Contacts were not properly inserted, as expected.');
        }
    }

}