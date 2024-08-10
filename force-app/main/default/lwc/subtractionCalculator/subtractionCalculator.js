import { LightningElement,track } from 'lwc';

export default class SubtractionCalculator extends LightningElement {
    @track currntOutput;
    first;
    second;
    
    firstHandler(event){
        this.first=event.target.value;
    }
    secondHandler(event){
        this.second=event.target.value;
    }
    SubHandler(){
        this.currntOutput='The Reuslt is:' +(this.first-this.second);
    }
}