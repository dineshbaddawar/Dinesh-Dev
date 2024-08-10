import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/lwcCombobox.getAccounts';

export default class LwcCombobox extends LightningElement {
   @track value='';
   @track accOption=[];

    get options(){
        return this.accOption;
    }

    // using Imperative Method here
    connectedCallback(){
        getAccounts()
        .then(result =>{
            let arr=[];
            for(var i=0;i<result.length;i++){
                arr.push({label:result[i].Name, value: result[i].Id})
            }
            this.accOption=arr;
        })
    }

    handleChanged(event){
        this.value=event.detail.value;
    }
}