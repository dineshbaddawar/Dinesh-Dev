public class FutureMethod {

    @future
    public static void Method_1(){
        List<Contact> conList=[Select Id,Title,phone,Email From Contact Where Title=null OR Phone=null OR Email=null];
        for(Contact con:conList){
            con.Title='SFDC';
            con.Phone='1234676566';
            con.Email='Salesforce.com';
        }
        update conList;
    }
}