public class DatabaseMethod {

    public static void DatabaseMethod_1(){
        
        List<Account> accList=new List<Account>();
        
        Account acc=new Account();
        acc.Name='Mike Hussy';
        accList.add(acc);
        
        Account acc1=new Account();
        acc1.AccountNumber='33889898';
        accList.add(acc1);
        
        Database.SaveResult [] strlist=Database.insert(accList,false);
        for(Database.SaveResult str:strlist){
            if(str.isSuccess()){
                System.debug('The Record is Inserted & Id :'+str.getId());
            }else{
                for(Database.Error error:str.getErrors()){
                    System.debug('The Error is Occured & The error is'+error.getMessage());
                }
            }
        }
        
    }
}