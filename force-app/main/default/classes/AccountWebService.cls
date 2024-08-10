@RestResource(urlMapping='/createAccount/')
global with sharing class AccountWebService {
    
    @HttpPost
    global static String createAccount() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        // Parse the JSON request body
        String jsonString = req.requestBody.toString();
        system.debug('jsonString === >'+jsonString);
        Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(jsonString);
        
        // Extract the account name from the JSON body
        String accName = (String) params.get('accountName');
        
        if (accName == null) {
            res.statusCode = 400;
            return 'Account name is required';
        }
        
        // Create the Account record
        Account newAccount = new Account(Name = accName);
        try {
            insert newAccount;
            res.statusCode = 201;
            return 'Account created successfully with Id: ' + newAccount.Id;
        } catch (DmlException e) {
            res.statusCode = 500;
            return 'Error creating account: ' + e.getMessage();
        }
    }
}