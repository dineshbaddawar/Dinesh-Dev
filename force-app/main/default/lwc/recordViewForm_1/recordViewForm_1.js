import { LightningElement,api } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import SITE_FIELD from '@salesforce/schema/Account.Site';

export default class RecordViewForm_1 extends LightningElement {

    nameField = NAME_FIELD;
    objectApiName= ACCOUNT_OBJECT;
    phoneField = PHONE_FIELD;
    siteField = SITE_FIELD;
    @api recordId = "0015j00000UnaJuAAJ";
}