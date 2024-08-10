import { LightningElement,wire,track } from 'lwc';
import getOpportunity from '@salesforce/apex/SearchOpportunity.getOpportunity';
export default class SearchOppList extends LightningElement {
   opportunityName='';
   @track oppList=[];
   @wire(getOpportunity,{oppName:'$opportunityName'})
   retrieveOpportunity({error,data}){
       if(data){
           this.oppList=data;
       }
       else if(error){

       }
   }
   handleChange(event){
       this.opportunityName=event.target.value;
   }
}