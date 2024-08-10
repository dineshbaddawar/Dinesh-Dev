import { LightningElement,track } from 'lwc';

export default class IfTrueFalseCondtionally extends LightningElement {
    @track onClickButtonLabel = 'Show';
    message='Salesforce If:else Directive Example';
    @track cardShow=false;


    handleClick(event){
      const label= event.target.label;

      if(label === 'Show'){
          this.onClickButtonLabel='Hide';
          this.cardShow=true;
      }
      else if(label ==='Hide'){
          this.onClickButtonLabel='Show';
          this.cardShow=false;
      }
    }
}