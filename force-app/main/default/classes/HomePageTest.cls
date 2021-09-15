@isTest
public class HomePageTest {
    
    @TestSetup
    public static void makeData(){
        
        Product2 ore = new Product2();
        
        ore.Family = 'Ore';
        ore.Name = 'TestOre';
        
        Insert ore;
        
        ore = [SELECT id FROM Product2 WHERE Family = 'Ore'];
        
        List<MiningSite__c> lms = new List<MiningSite__c>();
        
        for(integer i = 0; i < 10; i++){
            MiningSite__c site = new MiningSite__c();
            site.EstimatedWorth__c = Math.random() * 200000;
            site.Ore__c = ore.Id;
            site.Name = String.valueOf(i);
            site.Location__Latitude__s = i+1;
            site.Location__Longitude__s = i+2;
            lms.add(site);
        }
        
        Insert lms;
    }
    
    
    @isTest
    public static void TP_tooltips(){
        HomePageCustom controller = new HomePageCustom();
        HomePageExtension extension = new HomePageExtension(controller);
        
        System.assert(extension.getToolTip().contains('TestOre'));
        System.assert(extension.getToolTip2().contains('TestOre'));
        System.assert(extension.getToolTip3().contains('TestOre'));
    }
    
    @isTest
    public static void TP_imgUrl(){
        HomePageCustom controller = new HomePageCustom();
        HomePageExtension extension = new HomePageExtension(controller);
        
        System.assert(extension.getImgUrl().contains('&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc'));
        System.assert(extension.getImgUrl().contains('https://image.maps.ls.hereapi.com/mia/1.6/mapview?'));
        
        System.assert(extension.getImgUrl2().contains('&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc'));
        System.assert(extension.getImgUrl2().contains('https://image.maps.ls.hereapi.com/mia/1.6/mapview?'));
        
        System.assert(extension.getImgUrl3().contains('&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc'));
        System.assert(extension.getImgUrl3().contains('https://image.maps.ls.hereapi.com/mia/1.6/mapview?'));
    }
    
    @isTest
    public static void TP_homepagecustom(){
        HomePageCustom controller = new HomePageCustom();
        System.assert(! controller.getbRender());
        
        System.assert(controller.getLead().getSObjectType().GetDescribe() == Schema.SObjectType.Lead);
        
        controller.save();
        
        System.assert(controller.getbRender());
        
    }
}