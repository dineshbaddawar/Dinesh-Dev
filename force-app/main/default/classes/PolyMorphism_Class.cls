public class PolyMorphism_Class { // Method overloading

    public void show(){
        System.debug('The Method without parameter');
    }
    
    public void show(integer i){
        System.debug('The Method with One Parameter');
    }
    
    public void show(integer i, string name){
        System.debug('The Method with Two Parameter');
    }
}