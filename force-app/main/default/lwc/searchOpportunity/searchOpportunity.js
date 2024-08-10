import { LightningElement,wire,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunitySearch.getOpportunity';
export default class SearchOpportunity extends LightningElement {
    opportunityName= '';
    @track opportunityList= [];
    @wire(getOpportunity,{oppName:'$opportunityName'})
    retrieveOpportunity({error,data}){
        if(data){
            this.opportunityList= data;
        }
        else if(error){

        }
    }
    handleKeyChange(event){
        this.opportunityName=event.target.value;
    }
}