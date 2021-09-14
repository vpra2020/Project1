@isTest
public class businessControllerTest {

    @isTest
    public static void TP_SaveTo(){
        test.startTest();
		businessController testC = new businessController();
        PageReference pageRef = Page.Business;
       	test.setCurrentPage(pageRef);
        testC.conString.FirstName = 'Kyle';
        testC.conString.LastName = 'Test';
        testC.conString.Email = 'KTest97@email.com';
        testC.conString.Phone = '123-456-7890';
        testC.conString.Fax = 'N/A';
        testC.conString.MailingStreet = 'N/A';
        testC.conString.MailingCity = 'N/A';
        testC.conString.MailingPostalCode = '77777';
        testC.conString.MailingState = 'N/A';
        testC.conString.MailingCountry = 'N/A';
        testC.SaveTo();
        system.assert(testC.bConCreated != null );

        test.stopTest();
    }
    
    @isTest
    public static void TP_HomePage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod1Controller = new businessController();    
        Test.setCurrentPageReference(prod1Controller.HomePage());
        System.assertEquals(Page.MapPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_copperPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod2Controller = new businessController();    
        Test.setCurrentPageReference(prod2Controller.copperPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_ironPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod3Controller = new businessController();    
        Test.setCurrentPageReference(prod3Controller.ironPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_icePage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod4Controller = new businessController();    
        Test.setCurrentPageReference(prod4Controller.icePage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_uraniumPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod5Controller = new businessController();    
        Test.setCurrentPageReference(prod5Controller.uraniumPage());
        System.assertEquals(Page.Uranium.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_thoriumPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod6Controller = new businessController();    
        Test.setCurrentPageReference(prod6Controller.thoriumPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }    
    


    
}