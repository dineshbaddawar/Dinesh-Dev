import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ToastEvent_1 extends LightningElement {

    handleFuncation(){
     this.showToast();
    }

    showToast(){
        const event=new ShowToastEvent({
            title: 'Toast Fired Successfully',
            message: 'Welcome to The Toast Event',
            variant: 'success',
        })
        this.dispatchEvent(event);
    }
}