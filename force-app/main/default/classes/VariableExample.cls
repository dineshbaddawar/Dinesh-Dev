public class VariableExample{
    integer myVariable;
    static integer data = 30;
    
    public static void Method(){
        VariableExample obj = new VariableExample();
        System.debug('Value of static variable :'+obj.myVariable);
        System.debug('Value of static variable: '+VariableExample.data);
    }
}