import { LightningElement,track } from 'lwc';

export default class SimpleMathCalculator extends LightningElement {
    @track currentOutput;
    first;
    second;

    firstHandler(event){
        this.first=parseInt(event.target.value);
    }
    secondHandler(event){
        this.second=parseInt(event.target.value);
    }
    addHandler(){
        this.currentOutput='The Result is :'+(this.first+this.second);
    }
    subHandler(){
        this.currentOutput='The Result is :'+(this.first-this.second);
    }
    divHandler(){
        this.currentOutput='The Result is :'+(this.first/this.second);
    }
    mulHandler(){
        this.currentOutput='The Result is :'+(this.first*this.second);
    }
}