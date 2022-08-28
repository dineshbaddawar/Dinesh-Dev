import { LightningElement,track } from 'lwc';

export default class Example_TrackAPI extends LightningElement {
    @track message;

    changeHandler(event){
        this.message=event.target.value;
    }
}