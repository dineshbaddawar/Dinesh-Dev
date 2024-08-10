import { LightningElement,api } from 'lwc';
import IPL_OBJECT from '@salesforce/schema/IPL__c';
import NAME_FIELD from '@salesforce/schema/IPL__c.Name';
import CAPTAIN_FIELD from '@salesforce/schema/IPL__c.Captain__c';
import HOMEGROUND_FIELD from '@salesforce/schema/IPL__c.HomeGround__c';
import OWNER_FIELD from '@salesforce/schema/IPL__c.Owner__c';
import TEAMPRIZE_FIELD from '@salesforce/schema/IPL__c.Team_Prize__c';

export default class RecordViewForm extends LightningElement {

    nameField = NAME_FIELD
   // objectApiName = IPL_OBJECT;
    captainField= CAPTAIN_FIELD;
    homegroundField = HOMEGROUND_FIELD;
    ownerField = OWNER_FIELD;
    teamprizeField = TEAMPRIZE_FIELD;

   @api recordId;
   @api objectApiName;
}