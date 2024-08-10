import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/SearchAccount.getAccounts';
export default class SearchAccount extends LightningElement {
    accountName;
    @track accountList= [];
    @wire(getAccounts,{actName:'$accountName'})
    retrieveAccount({error,data}){
        if(data){
            this.accountList=data;
        }
        else if(error){

        }
    }
    handleChange(event){
        this.accountName=event.target.value;
    }
}