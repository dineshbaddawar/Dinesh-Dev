import { LightningElement,track } from 'lwc';
import getTeam from '@salesforce/apex/ImperativeMethodClass.getTeam';

export default class ImperativeMethod extends LightningElement {
    @track data=[];
    @track columns=[
        {label:'Record Name',fieldName:'Name'},
        {label:'Record Id',fieldName:'Id'},
    ];

    connectedCallback(){
        getTeam()
        .then(result=>{
         this.data=result;
        })
        .catch(error=>{
            this.error=error; // or 
            console.log("error is occured");
        })
    }
}