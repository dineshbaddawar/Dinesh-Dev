import { LightningElement, track } from 'lwc';

export default class Example_ifTrueFalse extends LightningElement {
   @track name;
   @track color;
   @track price;
   @track condition=true;

   nameHandler(event){
       this.name=event.target.value;
   }

   colorHandler(event){
       this.color=event.target.value;
   }

   priceHandler(event){
       this.price=event.target.value;
   }
   saveHandler(){
       this.condition=false;
   }
}