import { LightningElement,wire,track } from 'lwc';
import getAccount from '@salesforce/apex/DataAccountList.getAccount';
export default class DataTableAccountList extends LightningElement {
    @track data;
    @track columns= [
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'}
    ];
    @wire(getAccount) accountRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}