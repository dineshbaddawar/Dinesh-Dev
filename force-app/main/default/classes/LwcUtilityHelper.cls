public class LwcUtilityHelper {

  @AuraEnabled
  public static String insertAccounts(String jsonString) {
      System.debug('jsonString == >'+jsonString);
        // Parse JSON string into list of AccountData objects
        List<AccountData> accountList = (List<AccountData>) JSON.deserialize(jsonString, List<AccountData>.class);
         System.debug('accountList == >'+accountList);
         List<Account> accountsToInsert = new List<Account>();
         List<Object> jsonData = (List<Object>) JSON.deserializeUntyped(jsonString);
         System.debug('jsonData == >'+jsonData);
           for (Object obj : jsonData) {
                Map<String, Object> accMap = (Map<String, Object>) obj;
                System.debug('accMap == >'+accMap);
                 Account acc = new Account();
                  if (accMap.containsKey('Name')) {
                      acc.Name = (String) accMap.get('Name');
                  }
                if (accMap.containsKey('Annual Revenue')) {
                    System.debug('Annual Revenue == >'+accMap.get('Annual Revenue'));
                    String revenueStr = String.valueOf(accMap.get('Annual Revenue'));
                    acc.AnnualRevenue = Decimal.valueOf(revenueStr);
                }
                 if (accMap.containsKey('Description')) {
                     acc.Description = (String) accMap.get('Description');
                 }
                 if (accMap.containsKey('Phone')) {
                     acc.Phone = (String) accMap.get('Phone');
                 }
                 accountsToInsert.add(acc);
           }
        if(!accountsToInsert.isEmpty()) {
            insert accountsToInsert;
            System.debug('Account inserted size == >'+accountsToInsert.size());
            if(accountsToInsert.size()>0){
                return 'SUCCESS';
            }else{
                return 'ERROR';
            }
        }
        return null;
    }

}