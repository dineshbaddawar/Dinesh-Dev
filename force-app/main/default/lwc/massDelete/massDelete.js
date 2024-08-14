import { LightningElement,wire,track,api } from 'lwc';
 import getContactList from '@salesforce/apex/UtilityClassDev.getContactListBulkDelete';
 import deleteSelectedContacts from '@salesforce/apex/UtilityClassDev.deleteSelectedContacts';
 import { refreshApex } from '@salesforce/apex';
 import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MassDelete extends LightningElement {
    @api recordId;
    @track selectedContactIdList=[];
    @track message;
    @track contactList ;
    @track error;
    @track columns=[
        {label:'Name',fieldName:'Name',type:'text'}
    ];

    @wire(getContactList,{ recordId: '$recordId' })
    contacts({error,data}) {
        debugger;
        if (data) {
            this.contactList = data;
        } else if (error) {
            this.error = error;
        }
    }

   deleteSelRecords(){
    deleteSelectedContacts({selContactIdList:this.selectedContactIdList})
    .then(result => {               
        this.dispatchEvent( 
            new ShowToastEvent({
                title: 'Success',
                message: 'Selected Contacts are deleted!',
                variant: 'success',
            }),
        );    
          //for clearing selected row indexs 
        this.template.querySelector('lightning-datatable').selectedRows = [];

        return refreshApex(this.contactList);        
    })
    .catch(error => {
        this.message = undefined;
        this.error = error;
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error creating records',
                message: error.body.pageErrors[0].message,
                variant: 'error',
            }),
        );
        console.log("error", JSON.stringify(this.error));
    });
   }
   prepareSelectedRows(event){
    const selectedRows=event.detail.selectedRows; 
    this.selectedContactIdList = []; 
    for (let i = 0; i < selectedRows.length; i++){           
        this.selectedContactIdList.push(selectedRows[i].Id);
    }  
    console.log('Selected Contact List == >'+this.selectedContactIdList);   
   }
}