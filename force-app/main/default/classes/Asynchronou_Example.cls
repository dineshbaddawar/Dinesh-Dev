public class Asynchronou_Example implements schedulable {

    public void Execute(SchedulableContext bc){
        List<Account> accList=[Select Id,Name,Phone From Account Where Phone=null];
        delete accList;
    }

}