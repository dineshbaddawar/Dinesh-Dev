import { LightningElement,track,wire } from 'lwc';
import getContact from '@salesforce/apex/ContactApex.getContact';

export default class DataTableListofContact extends LightningElement {
    @track data;
    @track columns= [
        { label:'FirstName', fieldName:'FirstName',type:'text'},
        { label:'LastName', fieldName:'LastName',type:'text'},
        { label:'Phone',fieldName:'Phone',type:'phone'},
        { label:'Email', fieldName:'Email',type:'email'}
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