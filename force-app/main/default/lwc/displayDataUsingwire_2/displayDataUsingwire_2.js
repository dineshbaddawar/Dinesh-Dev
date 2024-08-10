import { LightningElement, track, wire } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunity';
export default class DisplayDataUsingwire_2 extends LightningElement {
    @track data;
    @wire(getOpportunity) opportunityRecord({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}