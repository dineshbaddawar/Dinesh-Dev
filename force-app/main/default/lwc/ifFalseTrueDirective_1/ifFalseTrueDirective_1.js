import { LightningElement,track } from 'lwc';

export default class IfFalseTrueDirective_1 extends LightningElement {

    @track name;
    @track number;
    @track email;
    @track Bank =true;

    nameHandler(event){
        this.name=event.target.value;
    }
    numberHandler(event){
        this.number=event.target.value;
    }
    emailHandler(event){
        this.email=event.target.value;
    }
    saveButtonHandler(){
        this.Bank=false;
    }
   

}