@isTest
public class AboutUsControllerTest {

	@isTest
    public static void TP_AboutUsPage() {
        // Use Test.setCurrentPage() to work with pages within a test environment
        Test.setCurrentPage(Page.AboutUs);
        
        AboutUsController aboutus = new AboutUsController();
        
        // Set our page to the AboutUs page to ensure the AboutUsPage method gives the right page reference.
        Test.setCurrentPageReference(aboutus.AboutUsPage());
        
        // Ensure the url's are equal to make sure the same page is being displayed.
        System.assertEquals(Page.AboutUs.getUrl(), ApexPages.currentPage().getUrl());
    }
    
    @isTest
    public static void TP_CompanyPage() {
        // Use Test.setCurrentPage() to work with pages within a test environment
        Test.setCurrentPage(Page.AboutUs);
        
        AboutUsController aboutus = new AboutUsController();
        
        // Set our page to the AboutUs page to ensure the AboutUsPage method gives the right page reference.
        Test.setCurrentPageReference(aboutus.CompanyPage());
        
        // Ensure the url's are equal to make sure the same page is being displayed.
        System.assertEquals(Page.Company.getUrl(), ApexPages.currentPage().getUrl());
    }
    
    @isTest
    public static void TP_BoardofDirectorsPage() {
        // Use Test.setCurrentPage() to work with pages within a test environment
        Test.setCurrentPage(Page.AboutUs);
        
        AboutUsController aboutus = new AboutUsController();
        
        // Set our page to the AboutUs page to ensure the AboutUsPage method gives the right page reference.
        Test.setCurrentPageReference(aboutus.BoardofDirectorsPage());
        
        // Ensure the url's are equal to make sure the same page is being displayed.
        System.assertEquals(Page.BoardofDirectors.getUrl(), ApexPages.currentPage().getUrl());
    }
    
    @isTest
    public static void TP_PurposeValuesPage() {
        // Use Test.setCurrentPage() to work with pages within a test environment
        Test.setCurrentPage(Page.AboutUs);
        
        AboutUsController aboutus = new AboutUsController();
        
        // Set our page to the AboutUs page to ensure the AboutUsPage method gives the right page reference.
        Test.setCurrentPageReference(aboutus.PurposeValuesPage());
        
        // Ensure the url's are equal to make sure the same page is being displayed.
        System.assertEquals(Page.PurposeValues.getUrl(), ApexPages.currentPage().getUrl());
    }
    
    @isTest
    public static void TP_CareersPage() {
        // Use Test.setCurrentPage() to work with pages within a test environment
        Test.setCurrentPage(Page.AboutUs);
        
        AboutUsController aboutus = new AboutUsController();
        
        // Set our page to the AboutUs page to ensure the AboutUsPage method gives the right page reference.
        Test.setCurrentPageReference(aboutus.CareersPage());
        
        // Ensure the url's are equal to make sure the same page is being displayed.
        System.assertEquals(Page.Careers.getUrl(), ApexPages.currentPage().getUrl());
    }
    
    @isTest
    public static void TP_checkEmail() {
        
        AboutUsController aboutus = new AboutUsController(); 
        aboutus.email = 'abc@gmail.com';
        Integer result = aboutus.checkEmail();
        
        //Valid email verification
        System.assertEquals(result, 1);
    }
    
    @isTest
    public static void TN_checkEmail() {
        
        AboutUsController aboutus = new AboutUsController(); 
        aboutus.email = 'abc.gmail.com';
        Integer result = aboutus.checkEmail();
        
        //InValid email verification
        System.assertEquals(result, 2);
    }
    
    @isTest
    public static void TN_checkEmail0() {
        
        AboutUsController aboutus = new AboutUsController(); 
        aboutus.email = null;
        Integer result = aboutus.checkEmail();
        
        //Null email verification
        System.assertEquals(result, 0);
    }
    
    @isTest
    public static void TP_getDynamic() {
        
        AboutUsController aboutus = new AboutUsController(); 
        aboutus.email = 'abc@gmail.com';
        Component.apex.outputtext msg = aboutus.getDynamic();
        
        //Message validation
        System.assertEquals(msg.value, 'Thanks for Subscribing!');
    }
    
    @isTest
    public static void TN_getDynamic() {
        
        AboutUsController aboutus = new AboutUsController(); 
        aboutus.email = null;
        Component.apex.outputtext msg = aboutus.getDynamic();
        
        //Message validation
        System.assertEquals(msg.value, 'Please enter your Email Address!');
    }
}