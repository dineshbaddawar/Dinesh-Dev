public class QueueableMethod implements Queueable {

    public void Execute(QueueableContext bc){
       List<Contact> conList=[Select Id,Title,phone,Email From Contact Where Title=null];
        for(Contact con:conList){
            con.Title='SFDC CRM';
            
        }
        update conList;
    }
}