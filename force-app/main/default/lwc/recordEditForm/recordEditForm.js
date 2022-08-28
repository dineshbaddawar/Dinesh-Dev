import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import IPL_OBJECT from '@salesforce/schema/IPL__c';
import NAME_FIELD from '@salesforce/schema/IPL__c.Name';
import CAPTAIN_FIELD from '@salesforce/schema/IPL__c.Captain__c';
import HOMEGROUND_FIELD from '@salesforce/schema/IPL__c.HomeGround__c';
import OWNER_FIELD from '@salesforce/schema/IPL__c.Owner__c';
import TEAMLOGO_FIELD from '@salesforce/schema/IPL__c.Team_Logo__c';
import TEAMPRIZE_FIELD from '@salesforce/schema/IPL__c.Team_Prize__c';

export default class RecordEditForm extends LightningElement {

    objectApiName = IPL_OBJECT;
    nameField = NAME_FIELD;
    captainField= CAPTAIN_FIELD;
    homegroundField=HOMEGROUND_FIELD;
    ownerField=OWNER_FIELD;
    teamlogoField=TEAMLOGO_FIELD;
    teamprizeField=TEAMPRIZE_FIELD;
    recordId = 'Id Displayed Here';

    handleSuccess(event){

        this.recordId=event.detail.id;
        const events = new ShowToastEvent({
            title: 'Successful',
            message: 'Record Created',
            variant: 'success'
        });
        this.dispatchEvent(events);
    }
}