import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountApex.getAccount';
export default class AccountApexList extends LightningElement {
    @track data;
    @wire(getAccount) accountRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}