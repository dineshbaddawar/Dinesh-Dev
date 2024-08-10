import { LightningElement,track,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
export default class DataTableWithWire_1 extends LightningElement {

    @track data;
    @track columns = [
        { label:  'FirstName', fieldName: 'FirstName', type: 'text' },
        { label: 'LastName', fieldName: 'LastName', type: 'text'},
        { label: 'Phone', fieldName: 'Phone', type: 'phone'},
    ];
    @wire (getContacts) contactRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}