import { LightningElement,track } from 'lwc';

export default class SimpleInterestCalculator extends LightningElement {
    @track currentOuput;
    principle;
    year;
    rate;

    principleHandler(event){
        this.principle=parseInt(event.target.value);
    }
    yearHandler(event){
        this.year=parseInt(event.target.value);
    }
    rateHandler(event){
        this.rate=parseInt(event.target.value);
    }
    calculateHandler(){
        this.currentOuput='Interest is--'+(this.principle*this.rate*this.year)/100;
    }

}