import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
export default class DisplayDataUsingWire_1 extends LightningElement {
    @track data;
    @wire(getContacts) contactRecords({error,data}){
        if(data){
            this.data= data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}