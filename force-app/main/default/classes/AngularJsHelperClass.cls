public with sharing class AngularJsHelperClass {

    // Method:1 Get All Opportunity From Database
    public Static String getOpportunity(){
        return JSON.serialize([SELECT Id,Name,StageName,CloseDate FROM Opportunity LIMIT 10]);
   }

    // Method:2 Get All Account From Database.
   public Static String getAccounts(){
    return JSON.serialize([SELECT ID,Name,Phone FROM Account LIMIT 10]);
}
    // Method: 3 Get All Contact From  Database
    public Static String getContacts(){
        return JSON.serialize([SELECT Id,FirstName,LastName,Email,Phone FROM Contact LIMIT 10]);
    }

}