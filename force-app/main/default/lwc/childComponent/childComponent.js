import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
   @api itemName='Salesforce Developer';

  @api handleChangeValue(){ 
       this.itemName="Value changing from Parent Funcation: Salesforce Admin";
   }
}