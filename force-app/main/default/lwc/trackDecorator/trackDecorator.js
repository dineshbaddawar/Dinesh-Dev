import { LightningElement,track } from 'lwc';

export default class TrackDecorator extends LightningElement {
    @track greeting;
    @track location;
    @track phone;
    handleGreeting(event){
        this.greeting=event.target.value;
    }
    handleLocation(event){
        this.location=event.target.value;
    }
    handlePhone(event){
        this.phone=event.target.value;
    }
}