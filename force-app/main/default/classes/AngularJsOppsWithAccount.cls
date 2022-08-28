public with sharing class AngularJsOppsWithAccount {
   
    // finding all the opportunities records related to particular account by providing account id
    // Hardcoe AccountId 
    static String accId = '0015j00000CduMRAAZ';

    public static String GetAccountId(){
        return JSON.serialize([SELECT Id,Name,Phone FROM Account Where ID =:accId][0]);
    }

    // public static String getAccount() {
    //     return JSON.serialize([select name, billingstreet,
    //         billingcity, billingstate, billingpostalcode
    //         from account where id = :AccountId][0]);
    // }

    public static String GetOpportunity(){
        return JSON.serialize([SELECT AccountId,Name,Amount FROM OPportunity WHERE AccountId =: accId]);
    }
}