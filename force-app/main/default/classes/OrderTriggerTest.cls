@isTest
public with sharing class OrderTriggerTest {

    @TestSetup
    static void makeData(){
        //make a product
        populateMockProd();

        // make an account
        populateMockAccount();

        // make mock mining sites
        populateMockSites();

        AggregateResult result = [SELECT COUNT(Id) FROM MiningSite__c];
        System.assert((Integer)result.get('expr0') > 0, 'NOTHING WAS INSERTED');
        
        // make mock orders
        populateMockOrders();

        Pricebook2 book = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        Update book;

        Product2 uranium = [Select Id FROM Product2];
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = book.Id,
            Product2Id = uranium.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;

        pbe = [SELECT Id FROM PricebookEntry];
        List<MiningSite__c> mock_sites = [SELECT Id FROM MiningSite__c];
        List<Order> mock_orders = [SELECT Id FROM Order];
        List<OrderItem> mock_prods = new List<OrderItem>();

        for(Integer i = 0; i < mock_orders.size(); i++){

            OrderItem prod = new OrderItem();

            prod.OrderId = mock_orders[i].Id;

            prod.Quantity = 1;

            prod.UnitPrice = 1020;

            prod.PricebookEntryId = pbe.Id;

            mock_prods.add(prod);

            mock_orders[i].MiningSite__c = mock_sites[i].Id;
            mock_orders[i].Pricebook2Id = book.Id;
        }
        Update mock_orders;
        Insert mock_prods;
        //Update mock_orders;
    }

    
    @isTest
    public static void TS_test_change(){

        List<MiningSite__c> estimates = [SELECT EstimatedWorth__c FROM MiningSite__c];

        List<Order> orders = [SELECT Status FROM Order];

        orders[0].Status = 'Activated';

        Update orders;

        List<MiningSite__c> estimatesAfter = [SELECT EstimatedWorth__c FROM MiningSite__c];

        for(Integer i = 0; i < estimates.size(); i++){
            if(estimates[0].EstimatedWorth__c != estimatesAfter[0].EstimatedWorth__c){
                System.assert(true);
            }else{
                System.assert(false,'Nothing changed');
            }
        }
    }

    @isTest
    public static void TB_test_change(){

        List<MiningSite__c> estimates = [SELECT EstimatedWorth__c FROM MiningSite__c];

        List<Order> orders = [SELECT Status FROM Order];

        for(Order ord : orders){
            ord.Status = 'Activated';
        }
        
        Update orders;

        List<MiningSite__c> estimatesAfter = [SELECT EstimatedWorth__c FROM MiningSite__c];

        for(Integer i = 0; i < estimates.size(); i++){
            if(estimates[i].EstimatedWorth__c != estimatesAfter[i].EstimatedWorth__c){
                System.assert(true);
            }else{
                System.assert(false,'Nothing changed');
            }
        }
    }

    @isTest
    public static void TR_test_justAboveMinimum_profile(){
        User testUser = [SELECT FIELDS(STANDARD) FROM User WHERE Alias = 'kw' LIMIT 1];
    
        Test.startTest();
            System.runas(testUser)
            {
                try{
                    TB_test_change();
                    System.assert(true);
                }catch(Exception e){
                    System.assert(false);
                }  
            }
        Test.stopTest();

    }
    // @isTest
    // public static void TR_test_minimum_profile(){
    //     User u = [SELECT FIELDS(STANDARD) FROM User WHERE Alias = 'btyle' LIMIT 1];
    //     User testUser = new User(LastName = 'afdsf32sdfasfd', 
    //     Username = 'sdf32arf35gfddfgdsa@example.com', 
    //     Email = 'tesfat.dsafsa1@examaf3awfple.com', 
    //     Alias = 'tesu1', 
    //     TimeZoneSidKey = 'GMT', 
    //     LocaleSidKey = 'en_GB', 
    //     EmailEncodingKey = 'ISO-8859-1', 
    //     ProfileId = u.ProfileId,
    //     LanguageLocaleKey = 'en_US',
    //     IsActive = true);    

    //     Test.startTest();
    //         System.runas(testUser)
    //         {
    //             try{
    //                 TB_test_change();
    //                 System.assert(false);
    //             }catch(Exception e){
    //                 System.assert(true);
    //             }  
    //         }
    //     Test.stopTest();
    // }

    private static void populateMockSites(){

        List<MiningSite__c> mock_sites = new List<MiningSite__c>();

        for(Integer i = 0; i < 10; i++){
            MiningSite__c site = new MiningSite__c();

            site.EstimatedWorth__c = 50000;

            site.Name = 'Site' + i;

            site.Active__c = true;

            mock_sites.add(site);
        }

        Insert mock_sites;

        AggregateResult result = [SELECT SUM(EstimatedWorth__c) sum FROM MiningSite__c];
        System.assert((Decimal)result.get('sum') > 50000, 'Sum of initial site values need be > 0');

    }

    private static void populateMockOrders(){
        Account acc = [SELECT Id FROM Account];

        List<MiningSite__c> mock_sites = [SELECT Id FROM MiningSite__c];

        List<Order> mock_orders = new List<Order>();
        
        for(Integer i = 0; i < 10; i++){
            Order ord = new Order();

            ord.MiningSite__c = mock_sites[i].Id;

            ord.Status = 'Draft';

            ord.AccountId = acc.Id;

            ord.EffectiveDate = Date.today();

            mock_orders.add(ord);
        }

        Insert mock_orders;
    }

    private static void populateMockAccount(){
        Account acc = new Account();
        acc.Name = 'MOCK ACCOUNT';
        
        try{
            Insert acc;
        }
        catch(Exception e){
            System.assert(false, 'Account could not be added');
        }
    }


    private static void populateMockProd(){
        Product2 prod = new Product2();
        prod.Name = 'Uranium';
        prod.IsActive = true;
        Insert prod;
    }
}