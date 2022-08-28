public with sharing class AngulatJSAccount {
    
    public Static String getAccounts(){
        return JSON.serialize([SELECT ID,Name,Phone FROM Account LIMIT 10]);
    }
}