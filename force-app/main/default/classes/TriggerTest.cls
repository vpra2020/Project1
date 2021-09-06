//@isTest
public with sharing class TriggerTest {

    public TriggerTest() {

    }

   // @TestSetup
    public static void makeData(){

        test_name_filler('Joe', 'W', 'email@email.com');

    }

  //  @isTest
    public static void TP_MyFirstTrigger(){

        //Test.startTest();

        //Test.stopTest();

        List<Contact> consBefore = [SELECT FirstName, Email FROM Contact WHERE FirstName = 'Joe'];

        test_name_filler('NotJoe', 'WW', 'email@email.com');    // should be prevented from being inserted, because same email

        List<Contact> consAfter = [SELECT FirstName, Email FROM Contact];   // WHERE FirstName = 'NotJoe'];

        system.assertEquals(consBefore.size(), consAfter.size());
    }

    private static void test_name_filler(String first, String lasts, String email){
        List<Contact> toInsert = new List<Contact>();

        for(Integer i = 0; i < 100; i++){

            Contact con = new Contact();
            con.FirstName = first;
            con.LastName = lasts;
            con.Email = email;

            toInsert.add(con);
        }
        
        try{
            Insert toInsert;
        }
        catch(Exception e){
            System.debug('Exception caught while trying to insert, continuing');
        }
        
    }

}