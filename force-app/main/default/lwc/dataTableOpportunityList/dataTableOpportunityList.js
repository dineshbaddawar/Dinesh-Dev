import { LightningElement,track,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/DataOpportunityList.getOpportunity';
export default class DataTableOpportunityList extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Amount',fieldName:'Amount',type:'currency'}
    ];
    @wire(getOpportunity) oppRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}