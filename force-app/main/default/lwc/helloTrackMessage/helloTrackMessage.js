import { LightningElement,track } from 'lwc';

export default class HelloTrackMessage extends LightningElement {
    @track message;
    @track details;
    
    handleMessage(event){
        this.message=event.target.value;
    }
    handleDetail(event){
        this.details=event.target.value;
    }
}