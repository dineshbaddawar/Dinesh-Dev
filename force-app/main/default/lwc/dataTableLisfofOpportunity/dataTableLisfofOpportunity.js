import { LightningElement,wire,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunity';

export default class DataTableLisfofOpportunity extends LightningElement {
    @track data;
    @track columns= [
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'StageName',fieldName:'StageName',type:'text'},
        {label:'Amount', fieldName:'Amount',type:'currency'}
    ];

    @wire(getOpportunity) opportunityRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}