import { LightningElement,track,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactApex.getContacts';
export default class WireDecoratorForContact extends LightningElement {
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