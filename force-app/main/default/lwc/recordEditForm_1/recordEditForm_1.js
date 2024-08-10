import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import ACCOUN_OBJECt from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import SITE_FIELD from '@salesforce/schema/Account.Site';

export default class RecordEditForm_1 extends LightningElement {

    objectApiName = ACCOUN_OBJECt;
    name = NAME_FIELD;
    site = SITE_FIELD;
    recordId = 'Id Displayed Here';

    handleSuccess(event){

        this.recordId = event.detail.id;

        const events = new ShowToastEvent({
            title: 'Successful',
            message: 'Record Created Successfully',
            variant: 'success'
        });
        this.dispatchEvent(events);
    }

}