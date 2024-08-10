import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class DataTable extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name',type:'text'}
    ];
    @wire(getAccounts) accountRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}