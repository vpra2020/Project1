public class SustainabilityExtension {
    
    public Account myAcc{get; set;}
    transient public Integer val {get; set;}
    public ID idAccount;
    public List<Account> myAccs = new List<Account>();
    
    public SustainabilityExtension(ApexPages.StandardSetController sController){
        PageReference auxPage = ApexPages.currentPage();
        idAccount = auxPage.getParameters().get('id');
        
        if (idAccount != null){
            try{myAcc = [SELECT name, NumberOfEmployees, NumberofLocations__c, AccountNumber, AnnualRevenue, Industry 
                         FROM Account WHERE id = :idAccount]; 
               }
            catch (System.Exception e){
                myAcc = new Account(name='Account Test Error',  NumberOfEmployees = 10, NumberofLocations__c = 5);
            }
        }    
    }
    
    // Start :Pie Information About Sustainability  
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Edge Comunication', 30));
        data.add(new PieWedgeData('Burlington Enterprise', 15));
        data.add(new PieWedgeData('Pyramid', 10));
        data.add(new PieWedgeData('United Oil', 20));
        data.add(new PieWedgeData('Express Logistics', 20));
        
        return data;
    }
    
    // Wrapper class
    public class PieWedgeData {        
        public String name { get; set; }
        public Integer data { get; set; }
        
        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
    
    // End :Pie Information About Sustainability
    
    public Component.Apex.OutputText getPillar(){
        Component.Apex.OutputText output = new Component.Apex.OutputText();
        switch on val {
            when 1 {	
                output.value = 'Social';
            }
            when 2 {	
                output.value = 'Human';
            }
            when 3 {	
                output.value = 'Economic';
            }
            when 4 {	
                output.value = 'Enviromental';
            }
            when else{
                output.value = 'Only Four Sustainability Pillars, Check Again.';
            }
        }
        return output;
        
    }
}