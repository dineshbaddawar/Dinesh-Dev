import { LightningElement, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContactRecordsList';
export default class DataImperative_1 extends LightningElement {
    @track contactRecords;
    @track errors;
    @track columns = [
       { label:'FirstName', fieldName:'FirstName',type:'text' },
       { label:'LastName',fieldName:'LastName',type:'text'}
    ];
    connectedCallback(){
        getContacts()
        .then(result=>{
            this.contactRecords = result;
        })
        .catch(error=>{
            this.errors = error;
        })
    }
}