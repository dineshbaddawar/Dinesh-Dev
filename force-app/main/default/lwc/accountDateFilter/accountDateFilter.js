import { LightningElement, track } from 'lwc';
import getOpportunitiesByDate from '@salesforce/apex/UtilityClassDev.getOpportunitiesByDate';

export default class AccountDateFilter extends LightningElement {
    @track startDate;
    @track endDate;
    @track opportunities = [];
    @track error;

    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
        { label: 'Stage', fieldName: 'StageName' },
        { label: 'Amount', fieldName: 'Amount', type: 'currency' }
    ];

    handleStartDateChange(event) {
        debugger;
        this.startDate = event.target.value;
    }

    handleEndDateChange(event) {
        debugger;
        this.endDate = event.target.value;
    }

    getOpportunities() {
        debugger;
        getOpportunitiesByDate({ startDate: this.startDate, endDate: this.endDate })
            .then(result => {
                debugger;
                this.opportunities = result;
                this.error = undefined;
            })
            .catch(error => {
                debugger;
                this.opportunities = [];
                this.error = error.body.message;
            });
    }
}