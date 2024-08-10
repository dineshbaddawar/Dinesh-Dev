import { LightningElement, track, wire } from 'lwc';
import retriveContactData from '@salesforce/apex/lwcAppExampleApex.retriveContactData';
export default class DisplayContactsOnAccountName extends LightningElement {

    @track currentAccountName;
    @track searchAccountName;

    handleChangeAccName(event){
        this.currentAccountName=event.target.value;
    }

    handleAccountSearch(){
        this.searchAccountName=this.currentAccountName;
    }

    @track records;

    @track dataNotFound;

    @wire (retriveContactData,{keySearch:'$searchAccountName'})
    wireRecord({data,error}){
        if(data){
            this.records=data;
            this.error=undefined;
            this.dataNotFound='';
            if(this.records==''){
                this.dataNotFound='There is not Contact found related to Account name';
            }
        }else{
            this.error=error;
            this.data=undefined;
        }
    }
}