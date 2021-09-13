public class AboutUsController {
    
   public String email { get; set; }
     public String name {get; set;}
    public Integer yourmail {get; set;}
    public String yourResume {get; set;}
    
    public AboutUsController() {
        name = null;
        yourmail = null;
        yourResume = null;
    }
    
   
    public PageReference AboutUsPage() {
        return Page.AboutUs;
    }
 
    public PageReference CompanyPage() {
       return Page.Company;
    }
    public PageReference BoardofDirectorsPage() {
        return Page.BoardofDirectors;
    }
    public PageReference PurposeValuesPage(){
        return Page.PurposeValues;
    }
    public PageReference CareersPage(){
        return Page.Careers;
    }
     public Component.Apex.OutputText  getDynamic() {
       Component.Apex.OutputText output = new Component.Apex.OutputText();

         integer e = checkEmail();
         if (e == 1) {
            output.value = 'Thanks for Subscribing!';
                     }
         else if(e == 2) 
         {
         	output.value = 'Invalid Email address! Please check!';
          }
         else
         {
             output.value = 'Please enter your Email Address!';
         }
       return output;
    }
     
    public integer checkEmail()
    {   
        integer retVal=0;
        if (email == null){ 
            retVal=0;
        }
        else{
            if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}[.]{0,1}[a-zA-Z]{0,2}', email))
            { retVal=1;} 
             else
            {retVal=2;}
        }
        return retVal;
    }
    
}