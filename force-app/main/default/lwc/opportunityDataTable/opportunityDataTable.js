import { LightningElement,wire,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunity';
export default class OpportunityDataTable extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Amount',fieldName:'Amount',type:'currency'},
        {label:'StageName',fieldName:'StageName',type:'text'}
    ];

    @wire (getOpportunity) oppRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}