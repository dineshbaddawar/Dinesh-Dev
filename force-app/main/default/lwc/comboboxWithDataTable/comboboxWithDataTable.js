import { LightningElement,track } from 'lwc';
import getAccountForCombobox from '@salesforce/apex/ComboboxWithDataTable.getAccountForCombobox';
import getContacts from '@salesforce/apex/ComboboxWithDataTable.getContacts';

const columns=[
    {label:'Contact Name',fieldName:'Name'},
    {label:'Contact Email',fieldName:'Email'}
];
export default class ComboboxWithDataTable extends LightningElement {
    @track value='';
    @track optionsAray=[]; // this array will store the options for combobox
    @track cardVisible = false; // used for show/hide funcationality
    @track data=[]; // used to store contact detail in Datatable
    @track columns=columns;

    // this store opiton by returning ths optionsArray
    get options(){
        return this.optionsAray;
    }

    // calling Apex Method to get Account stored in SF
    connectedCallback(){
        getAccountForCombobox()
        .then(response=>{
            let arr=[]; // this array store the account details in label and value pair
            for(var i=0;i<response.length;i++){

                // add the account Name  as Label and Id as Value in arr[]
                arr.push({label: response[i].Name, value: response[i].Id})
            }
         this.optionsAray=arr;
        })
    }

    // get Selected Account recordId
    handleChangedValue(event){
       // whenever a account is selected in combobx then "cardVisible" will become true
       // Contact data=tablew will displayed to user.
        this.cardVisible=true;

        // this store selected accountId in "value" property
        this.value=event.detail.value;
       
        // call apex method to get Contacts of Selected Account
        getContacts({selectedAccountId : this.value}) // pass Selected account recordId to apex method to get related contacts
        .then(result =>{
            this.data=result;
        })
        .catch(error=>{
            window.alert("error:"+error)
        })
    }
}