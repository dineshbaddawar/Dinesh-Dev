import { LightningElement,track } from 'lwc';
import getAccount from '@salesforce/apex/ImperativeAccount.getAccount';

export default class ImperativeDataTableListofAccount extends LightningElement {
    @track accountRecord;
    @track errors;
    @track columns= [
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'}
       

    ];
    connectedCallback(){
        getAccount()
        .then(result=>{
            this.accountRecord = result;
        })
        .catch(error=>{
            this.errors=error;
        })
    }
}