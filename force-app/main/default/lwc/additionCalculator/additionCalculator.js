import { LightningElement,track } from 'lwc';

export default class AdditionCalculator extends LightningElement {
    @track currentOutput;
    first;
    second;

    firstChangeHandler(event){
        this.first=parseInt(event.target.value);
    }
    secondChangeHandler(event){
        this.second=parseInt(event.target.value);
    }
    additionHandler(){
        this.currentOutput='Answer is : '+(this.first+this.second);
    }
}