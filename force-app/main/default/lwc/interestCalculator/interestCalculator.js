import { LightningElement,track } from 'lwc';

export default class InterestCalculator extends LightningElement {
    @track currentOutput;
    principle;
    interest;
    year;
    principleHandler(event){
        this.principle = parseInt(event.target.value);
    }
    yearHandler(event){
        this.year=parseInt(event.target.value);
    }
    interestHandler(event){
        this.interest=parseInt(event.target.value);
    }
    calculateHandler(){
        this.currentOutput='Interest is  :'+(this.principle*this.interest*this.year)/100;
    }
}