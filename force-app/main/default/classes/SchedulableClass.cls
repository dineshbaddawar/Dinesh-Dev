public class SchedulableClass implements Schedulable {

    public void execute(SchedulableContext bc){
        List<Contact> conList=[Select Id,FirstName From Contact Where FirstName=null ];
        for(Contact con:conList){
            System.debug('the contacts Are deleted');
        }
        delete conList;
    }
}