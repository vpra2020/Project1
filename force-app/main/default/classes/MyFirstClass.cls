public with sharing class MyFirstClass {
    public MyFirstClass() {
        Contact m = new Contact();
        m.FirstName = 'APEX';
        m.LastName = 'PREDATOR';
        System.debug(m.RecordType);
        //insert m; // works!
    }


    public void SayHelloApex(){
        System.debug('HELLO APEX PREDATOR!');
    }

}