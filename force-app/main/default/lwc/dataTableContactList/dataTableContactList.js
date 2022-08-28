import { LightningElement,wire,track } from 'lwc';
import getContact from '@salesforce/apex/DataContactList.getContact';
export default class DataTableContactList extends LightningElement {
    @track data;
    @track columns=[
        {label:'FirstName',fieldName:'FirstName',type:'text'},
        {label:'LastName',fieldName:'LastName',type:'text'}
    ];
    @wire(getContact) contactRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}