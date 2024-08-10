import { LightningElement,track } from 'lwc';

export default class Example_1 extends LightningElement {
    
    @track brand;
    @track country;
    @track price;

    brandHandler(event){
        this.brand=event.target.value;
    }
    countryHandler(event){
        this.country=event.target.value;
    }
    priceHandler(event){
        this.price=event.target.value;
    }
}