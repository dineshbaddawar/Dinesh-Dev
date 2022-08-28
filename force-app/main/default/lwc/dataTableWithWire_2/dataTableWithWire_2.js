import { LightningElement, track,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunity';
export default class DataTableWithWire_2 extends LightningElement {
    @track data;
    @track columns= [
          { label:'Name', fieldName: 'Name', type:'text' },
          { label:'StageName', fieldName:'StageName', type:'text' },
          { label:'Amount',fieldName:'Amount', type:'currency'},
    ];
    @wire (getOpportunity) opportunityRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}