public without sharing class HomePageCustom {

    private Lead iLead; // "instance of Lead"
    
 	private boolean bRender = false;

    public HomePageCustom() {
        iLead = new Lead();
        ApexPages.Message a = new ApexPages.Message(ApexPages.Severity.INFO, 'MY ERROR MESSAGE');
        ApexPages.addMessage(a);
    }

    public Lead getLead() {
        return iLead;
    }

    public PageReference save() {
        
        try {
            
            Insert iLead;
            
            bRender = true;
            
        } catch(System.DMLException e) {
            
            ApexPages.addMessages(e);
            
        }
        
        return null;
    }
    
    public boolean getbRender(){
        return bRender;
    }
}