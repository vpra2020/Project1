@isTest
public class SustainabilityTest {
   
    @isTest static void test_TP(){
        Test.setCurrentPage(Page.SustainabilityM);
        
        SustainabilityController sCont = new SustainabilityController();
        Component.Apex.OutputText txtResp = new Component.Apex.OutputText();
        
        System.debug(ApexPages.currentPage().getParameters().get('NumberOfEmployees'));
        
        //System.assertEquals(10,NumEmp);
    }
}