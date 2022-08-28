import { LightningElement,track } from 'lwc';

export default class Example_Calculator extends LightningElement {
   @track output;
   number1;
   number2;

   oneHandler(event){
       this.number1=parseInt(event.target.value);
   }

   twoHandler(event){
       this.number2=parseInt(event.target.value);
   }
   
   saveHandler(){
       this.output='The Result is : '+(this.number1-this.number2);
   }
   addHandler(event){
       this.output='The Result is : '+(this.number1+this.number2);
   }
}