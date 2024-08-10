import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class AccountDataTable extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'text'},
        {label:'Email',fieldName:'Email',type:'text'}
    ];
     @wire (getAccounts) accountRecord({error,data}){
         if(data){
             this.data=data;
         }
         else if(error){
             this.data=undefined;
         }
     }
}