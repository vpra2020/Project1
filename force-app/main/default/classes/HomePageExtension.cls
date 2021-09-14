public without sharing class HomePageExtension {
  
    private List<MiningSite__c> top3;
    
    public HomePageExtension(HomePageCustom controller) {
		init();
    }

    public HomePageExtension(ApexPages.StandardController controller) {
		init();
    }
    
    private void init(){
        top3 = [SELECT Active__c, Cost_to_Travel__c, EstimatedWorth__c, Location__c, Name, Ore__r.Name FROM MiningSite__c ORDER BY EstimatedWorth__c DESC LIMIT 3];
    }
    
    private String imageUrlBase(Integer idx){
        
        String base = 'https://image.maps.ls.hereapi.com/mia/1.6/mapview?';
        String zoomAndKey = '&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc';
        
        Location loc = top3[idx].Location__c;
        
        String lat = String.valueOf(loc.latitude);
        String lon = String.valueOf(loc.longitude);
        
		String url = base + 'c=' + lat + '%2C' + lon + zoomAndKey;

        return url;
    }
    
    public String getImgUrl(){
        return imageUrlBase(0);
    }
    public String getImgUrl2(){
        return imageUrlBase(1);
    }
    public String getImgUrl3(){
        return imageUrlBase(2);
    }
    
    private String toolTipBase(Integer idx){
        return top3[idx].Name + ', primary ore ' + top3[idx].Ore__r.Name;
    }
    
    public String getTooltip(){
        return toolTipBase(0);
    }
    public String getTooltip2(){
        return toolTipBase(1);
    }
    public String getTooltip3(){
        return toolTipBase(2);
    }
}