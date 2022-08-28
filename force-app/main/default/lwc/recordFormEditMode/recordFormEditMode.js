import { LightningElement,track } from 'lwc';
import IPL_OBJECt from '@salesforce/schema/IPL__c';
import NAME_FIELD from '@salesforce/schema/IPL__c.Name';
import CAPTAIN_FIELD from '@salesforce/schema/IPL__c.Captain__c';

export default class RecordFormEditMode extends LightningElement {

    @track fields=[NAME_FIELD,CAPTAIN_FIELD];
    objectApiName = IPL_OBJECt;

    recordId = "a005j000007dsZMAAY";
    
}