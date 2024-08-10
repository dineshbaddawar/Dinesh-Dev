import { LightningElement,wire } from 'lwc';
import getAccountList from '@salesforce/apex/UtilityClassDev.getAccountList';
export default class GetAccountUsingWire extends LightningElement {
    accountdatalist;

  @wire(getAccountList) accountdata({error,data}){
      if(data){
          debugger;
        this.accountdatalist = data;
      }
  }
}