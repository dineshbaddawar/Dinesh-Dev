// navToNewRecordWithDefaults.js
import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';


export default class NavToNewRecordWithDefaults extends NavigationMixin(LightningElement) {
     connectedCallback(){
          this.navigateToNewContactWithDefaults();
     }
     navigateToNewContactWithDefaults() {
          const defaultValues = encodeDefaultFieldValues({
              FirstName: 'Morag',
              LastName: 'de Fault',
              LeadSource: 'Other'
          });
  
          console.log(defaultValues);
  
          this[NavigationMixin.Navigate]({
              type: 'standard__objectPage',
              attributes: {
                  objectApiName: 'Contact',
                  actionName: 'new'
              },
              state: {
                  defaultFieldValues: defaultValues
              }
          });
      }
  }