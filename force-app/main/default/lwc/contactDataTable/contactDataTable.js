import { LightningElement,wire,track } from 'lwc';
import getContacts from '@salesforce/apex/ContactApex.getContacts';
export default class ContactDataTable extends LightningElement {
    @track data;
    @track columns=[
        {label:'LastName',fieldName:'LastName',type:'text'},
        {label:'FirstName',fieldName:'FirstName',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'},
        {label:'Email',fieldName:'Email',type:'email'}
    ];
    @wire (getContacts) contactRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}