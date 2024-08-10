import { LightningElement } from 'lwc';
import Opportunity_Name from '@salesforce/schema/Opportunity.Name';
import Opportunity_CloseDate from '@salesforce/schema/Opportunity.CloseDate';
import Opportunity_StageName from '@salesforce/schema/Opportunity.StageName';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class OpportunityCreatorLWC extends NavigationMixin (LightningElement) {
  objectApiName = 'Opportunity';
  fieldList=[Opportunity_Name,Opportunity_CloseDate,Opportunity_StageName];
  handleOpportunity(event){
    const evt=new ShowToastEvent({
        title: "Opportunity Created Successfully",
        message: "Record ID "+event.detail.id,
        variant: "success",
    });
    this.dispatchEvent(evt);
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: event.detail.id,
            objectApiName: 'Opportunity',
            actionName: 'view'
        },
    });
  }
}