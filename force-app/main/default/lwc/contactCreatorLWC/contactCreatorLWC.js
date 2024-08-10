import { LightningElement } from 'lwc';
import Contact_FirstName from '@salesforce/schema/Contact.FirstName';
import Contact_LastName from '@salesforce/schema/Contact.LastName';
import Contact_Email from '@salesforce/schema/Contact.Email';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation';

export default class ContactCreatorLWC extends NavigationMixin (LightningElement) {
    objectApiName='Contact';
    fieldList= [Contact_FirstName,Contact_LastName,Contact_Email];
    handleContact(event){
       const evt=new ShowToastEvent({
           title:"Contact Created",
           message:"Record ID "+ event.detail.id,
           variant: "success",
       });
       this.dispatchEvent(evt);
       this[NavigationMixin.Navigate]({
           type:'standard__recordPage',
           attributes: {
               recordId: event.detail.id,
               objctApiName: 'Contact',
               actionName: 'view'
           },
       });
    }
}