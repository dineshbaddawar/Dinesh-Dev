import { LightningElement,wire,track } from 'lwc';
import getOpportunity from '@salesforce/apex/OpportunityController.getOpportunity';
export default class WireDecoratorForOpportunity extends LightningElement {
    @track data;
    @wire(getOpportunity) oppRecords({error,data}){
        if(data){
            this.data=data;
        }
        else if(error){
            this.data=undefined;
        }
    }
}