public class BatchApex implements Database.Batchable <Sobject> {

    public Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name,phone from Account');
    }
    public void Execute(Database.BatchableContext bc,List<Account> accList){
        for(Account acc:accList){
            if(acc.Phone=='90911111'){
                acc.Phone='8446557829';
            }
        }
        update accList;
    }
    public void Finish(Database.BatchableContext bc){
        
    }
}