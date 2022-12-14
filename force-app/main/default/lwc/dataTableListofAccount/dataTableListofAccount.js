import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class DataTableListofAccount extends LightningElement {
    @track data;
    @track columns= [
        { label:'Name', fieldName:'Name', type:'text' },
        { label:'Phone', fieldName:'Phone', type:'text'},
        { label:'Industry', fieldName:'Industry', type:'text'},
    ];
    @wire(getAccounts) accountRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}