import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccountRecordsList';
export default class DataImperative extends LightningElement {
    @track accountRecords;
    @track errors;
    @track columns= [
        { label:'Name', fieldName:'Name',type: 'text' },
        { label:'Industry', fieldName:'industry', type:'text'}
    ];
    connectedCallback(){
        getAccounts()
        .then(result=>{
            this.accountRecords = result;
        })
        .catch(error=>{
            this.errors = error;
        })
    }
}