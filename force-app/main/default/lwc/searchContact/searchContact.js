import { LightningElement,wire,track } from 'lwc';
import getContacts from '@salesforce/apex/ContactSearch.getContacts';
export default class SearchContact extends LightningElement {
    contactName= '';
    @track contactList= [];
    @wire(getContacts,{conName:'$contactName'})
    retrieveContacts({error,data}){
        if(data){
            this.contactList= data;
        }
        else if(error){

        }
    }
    handleKeyChange(event){
        this.contactName = event.target.value;
    }
}