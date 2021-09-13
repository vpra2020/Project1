public class SustainabilityController {
    
    public Account myAcc{get; set;}
    transient public Integer val {get; set;}
    public ID idAccount;
    public List<Account> myAccs = new List<Account>();
    
    public SustainabilityController (){        
        PageReference auxPage = ApexPages.currentPage();
        idAccount = auxPage.getParameters().get('id');
        
        System.debug('Entro : ' + idAccount);
        
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
        data.add(new PieWedgeData('Climate Change', 40));
        data.add(new PieWedgeData('Environment', 25));
        data.add(new PieWedgeData('Innovation and Tech.', 20));
        data.add(new PieWedgeData('People', 10));
        data.add(new PieWedgeData('Ethics', 5));
        
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
                output.value = 'Climate Change';
            }
            when 2 {	
                output.value = 'Environment';
            }
            when 3 {	
                output.value = 'Innovation and Technology';
            }
            when 4 {	
                output.value = 'People';
            }
            when 5 {	
                output.value = 'Ethics';
            }
            when else{
                output.value = 'Only Five (5) Sustainability Pillars, Check Again.';
            }
        }
        return output;
    }
}