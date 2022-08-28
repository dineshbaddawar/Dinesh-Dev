import { LightningElement,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunityRecordList';
export default class DataImperative_2 extends LightningElement {
@track opportunityRecords;
@track errors;
@track columns= [
       { label:'Name',fieldName:'Name',type:'text'},
       { label:'Amount', fieldName:'Amount', type:'currency'},
       { label:'Type',fieldName:'Type',type:'text'}
];
connectedCallback(){
    getOpportunity()
    .then(result=>{
        this.opportunityRecords = result;
    })
    .catch(error=>{
        this.errors = error;
    })
}

}