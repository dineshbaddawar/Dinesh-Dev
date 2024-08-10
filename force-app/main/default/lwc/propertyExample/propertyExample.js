import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class PropertyExample extends LightningElement {
    message='Salesforce India';

      connectedCallback(){
          let callMyFuncation= this.myFuncation(999, 81);
          window.alert('The Answer Arrow Method is :'+callMyFuncation);
      }

   
      myFuncation = (Variable1, Variable2) => {
          return (Variable1-Variable2); // Here we are performing subtraction
      }
}