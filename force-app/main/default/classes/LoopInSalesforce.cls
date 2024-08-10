public class LoopInSalesforce {
    
    // Traditional For Loop
    public static void TradLopp(){
        for(Decimal i=0; i<10; i++){
            System.debug('I value == >'+i);
        }
    }
    
    public static void TradLopp1(){
        for(Integer i=3; i<10; i++){
            System.debug('I value == >'+i);
        }
    }
    
    public static void printTable() {
        for (Integer i = 1; i <= 10; i++) {
            if(Math.mod(i, 2) == 1){
                System.debug('i Value == >'+i);
            }
        }
    }
    
    //Print Odd Number
    public static void printTable1() {
        for (Integer i = 1; i <= 100; i++) {
            if(Math.mod(i, 2) == 1){
                System.debug('i Value == >'+i);
            }
        }
    }
    
    //Print Total Odd Number
    public static void printTable2() {
        Integer TotalCount = 1 ;
        for (Integer i = 1; i <= 100; i++) {
            if(Math.mod(i, 2) == 1){
                TotalCount += i;
                // System.debug('i Value == >'+total);
                
            }
        }
         System.debug('TotalCount === >'+TotalCount);
    }
    
    //Print Even Number 
    public static void printTable3() {
        for (Integer i = 0; i <= 100; i++) {
            if(Math.mod(i, 2) == 0){
                
                System.debug('i Value == >'+i);
            }
        }
    }
    
    //Print Even Number total 
    public static void printTable4() {
        Integer TotalCount =0;
        for (Integer i = 0; i <= 100; i++) {
            if(Math.mod(i, 2) == 0){
                TotalCount += i;
            }
        }
        System.debug('TotalCount === >'+TotalCount);
    }
    
      
    // List / Set For Loop
    public static void ListLopp(){
        List<Decimal> decmialList = new List<Decimal>();
        decmialList.add(1);
        decmialList.add(2);
        for(Decimal var : decmialList){
            System.debug('var value == >'+var);
        }
    }
    
    public static void ListLopp1(){
        List<String> StringList = new List<String>();
        StringList.add('sanjana');
        StringList.add('sanju');
        StringList.add('sonu');
        StringList.add('sana');
        StringList.add('friend');
        StringList.add('sister');
        System.debug('Last value == >'+StringList);
        
        for(String var : StringList){
            System.debug('var value == >'+var);
        }
    }
    
    public static void ListLopp2(){
        List<double> doubleList = new List<Double>();
        doubleList.add(1.5);
        doubleList.add(2.4);
        doubleList.add(3.4);
        doubleList.add(4.4);
        doubleList.add(5.3);
        doubleList.add(6.2);
        System.debug('Last value == >'+doubleList);
        
        for(Double var : doubleList){
            System.debug('var value == >'+var);
        }
    }
    
    public static void ListLopp3(){
        List<Long> LongList = new List<Long>();
        LongList.add(177343485);
        LongList.add(274375434);
        LongList.add(365356334);
        LongList.add(473763334);
        LongList.add(578356363);
        LongList.add(673763762);
        System.debug('Last value == >'+LongList);
        
        for( Long var : LongList){
            System.debug('var value == >'+var);
        }
    }
    
    public static void ListLopp4(){
        List<Long> LongList = new List<Long>();
        LongList.add(177343485);
        LongList.add(274375434);
        LongList.add(365356334);
        LongList.add(473763334);
        LongList.add(578356363);
        LongList.add(673763762);
        System.debug('Last value == >'+LongList);
        
        for( Long var : LongList){
            System.debug('var value == >'+var);
        }
    }
    
    // SOQL For Loop - Account
    public static void SoqlForLoop(){
        List<Account> getAccountList = [SELECT Id,Name FROM Account LIMIT 5];
        for(Account acc : getAccountList){
            System.debug('Account Name == >'+acc.Name);
        }
    }  
    
    // SOQL For Loop - Contact
    public static void SoqlForLoop1(){
        List<Contact> getContactList = [SELECT Id,Name FROM Contact LIMIT 5];
        for(Contact con : getContactList){
            System.debug('Contact Name == >'+con.Name);
        }
    }  
    
    // SOQL For Loop - Opportunity
    public static void SoqlForLoop2(){
        List<Opportunity> getOpportunityList = [SELECT Id,Name FROM Opportunity LIMIT 5];
        for(Opportunity Op : getOpportunityList){
            System.debug('Opportunity Name == >'+Op.Name);
        }
    }
    
    // SOQL For Loop - Lead
    public static void SoqlForLoop3(){
        List<Lead> getLeadList = [SELECT Id,Name FROM Lead LIMIT 5];
        for(Lead Le: getLeadList){
            System.debug('Lead Name == >'+Le.Name);
        }
    }
    
    // SOQL For Loop - Case
    public static void SoqlForLoop4(){
        List<Case> getCaseList = [SELECT AccountId,Subject FROM Case LIMIT 5];
        for(Case CS : getCaseList){
            System.debug('Case Name == >'+CS.AccountId);
        }
    }
    
    // SOQL For Loop - Task
    public static void SoqlForLoop5(){
        List<Task> getTaskList = [SELECT OwnerId,Subject FROM Task LIMIT 5];
        for(Task ts : getTaskList){
            System.debug('Task Name == >'+ts.OwnerId);
        }
    }
    // SOQL FOR LOOP - IPL
    Public Static Void SoqlFOrLoop6(){
        List<IPL__c> getIPLList = [select Captain__c,Name From IPL__c LIMIT 6];
        For(IPL__c san :getIPLList){
            System.debug('IPL Name == >'+SAN.Name); 
        }
        
    }
    
    Public Static Void Demomethod(){
        List<string>Colourlist = new list<string>();
         System.debug('Colourlist == >'+Colourlist); 
        
       Colourlist.add('Red');
       Colourlist.add('Blue');
       Colourlist.add('Green');   
       System.debug('Colourlist == >'+Colourlist);  
        List<Account> getColourList = [select Id,name  From Account LIMIT 6];
         System.debug('Colourlist == >'+Colourlist); 
    }
    
    
}