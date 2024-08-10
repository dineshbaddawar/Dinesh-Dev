import { LightningElement,track } from 'lwc';
import conList from '@salesforce/apex/lwcCombobox_1.conList';

export default class LwcCombobox_1 extends LightningElement {
    @track value='';
    @track conOpiton=[];

    get options(){

        return this.conOpiton;
    }
    // Using Imperative Method get The Contact Records
    connectedCallback(){
        conList()
        .then(result =>{
            let arr=[];
            for(var i=0;i<result.length;i++){
                arr.push({label:result[i].LastName, value:result[i].Id})
            }
            this.conOpiton=arr;
        })
    }

    handleChanged(event){
        this.value=event.detail.value;
    }
}